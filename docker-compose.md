# 🛠️ Ubuntu 22.04 開發環境建置教學

本教學將說明如何利用 Docker 建立一個專屬於開發者 `wwlouis` 的隔離環境，並透過 Docker Compose 進行自動化管理。

## 1. 檔案架構說明

在開始之前，請確保您的資料夾中包含以下檔案：

* `Dockerfile`：定義容器的作業系統、安裝軟體及使用者權限。
* `docker-compose.yml`：定義如何啟動容器、掛載目錄及執行指令 。
* `project/`：(資料夾) 用於存放您的原始碼，將與容器同步 。



---

## 2. Dockerfile 詳細解析

`Dockerfile` 是建置映像檔（Image）的藍圖：

* **基礎系統**：使用 `ubuntu:22.04` 作為底層作業系統。
* **環境變數**：設定 `DEBIAN_FRONTEND=noninteractive` 以避免安裝過程中的互動式提問。
* **自動化安裝**：
* 透過 `apt-get` 安裝 `sudo`、`vim`、`git` 與 `curl` 等必備工具。
* 建立使用者 `wwlouis` 並賦予其 `sudo` 免密碼權限。


* **工作目錄**：預設進入點設為 `/home/wwlouis`。
* **身分切換**：預設以 `wwlouis` 身分執行，提高安全性並符合開發習慣。

### 📄 原始程式碼複寫 (Dockerfile)

```dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 安裝常用工具並建立使用者
RUN apt-get update && \
    apt-get install -y sudo vim git curl && \
    useradd -m -s /bin/bash wwlouis && \
    echo "wwlouis ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 設定預設工作目錄
WORKDIR /home/wwlouis

# 用 wwlouis 身份啟動
USER wwlouis

CMD ["/bin/bash"]

```
## 3. Docker Compose 詳細解析

`docker-compose.yml` 簡化了啟動流程，將複雜參數參數化：

 
* **建置模式 (`build: .`)**：告訴 Compose 使用當前目錄下的 Dockerfile 進行編譯 。


* **容器命名**：固定容器名稱為 `ubuntu22_container` 。


* **資料卷掛載 (`volumes`)**：將主機的 `./project` 資料夾掛載至容器內的 `/home/wwlouis` 。這表示您在主機修改程式碼，容器內會同步更新。


* **互動模式 (`tty: true`)**：確保容器啟動後不會立即關閉，並允許終端機互動 。


* **執行指令**：啟動後預設執行 `/bin/bash` 。

### 📄 原始程式碼複寫 (docker-compose.yml)

```yaml
version: '3.8'

services:
  ubuntu_dev:
    build: .
    container_name: ubuntu22_container
    volumes:
      - ./project:/home/wwlouis
    tty: true
    command: ["/bin/bash"]

```

## 4. 如何啟動與使用

請在終端機執行以下指令：

### Step 1: 建置並啟動容器

```bash
docker-compose up -d

```

* `-d` 參數表示在背景執行。

### Step 2: 進入容器進行開發

```bash
docker exec -it ubuntu22_container /bin/bash

```

* 進入後，您將以 `wwlouis` 身分在 `/home/wwlouis` 目錄下操作。

### Step 3: 停止容器

```bash
docker-compose down
```

## 💡 小撇步

* **資料同步**：所有存放在主機 `./project` 目錄下的檔案，都會出現在容器的 `/home/wwlouis` 中 。


* **權限**：由於 `wwlouis` 擁有 `sudo` 權限，若需安裝額外套件，可在容器內執行 `sudo apt-get install <套件名稱>`。