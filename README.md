# 🐳 Docker 指令大全（完整整理版）

## 目錄

* [🖼️ Docker Image（映象）](#docker-image映象)
* [📦 Docker Container（容器）](#docker-container容器)
* [🏛️ Repository（貯藏庫）](#repository貯藏庫)
* [📤 匯出 / 匯入](#匯出--匯入)
* [🧹 系統清理](#系統清理)
* [🚀 常用快速指令](#常用快速指令)

---

# 🖼️ Docker Image（映象）

## 📋 Image 基本指令

| 指令                           | 說明                     |
| ---------------------------- | ---------------------- |
| `docker images`              | 列出本地所有 images（舊寫法但仍常用） |
| `docker images -a`           | 顯示所有 image（包含中介層）      |
| `docker image ls`            | 新寫法（正式）                |
| `docker image ls -a`         | 顯示所有 image             |
| `docker image inspect IMAGE` | 查看 image 詳細 metadata   |
| `docker image history IMAGE` | 查看建立流程與每層 Layer 歷史     |
| `docker rmi IMAGE`           | 刪除 image               |
| `docker search KEYWORD`      | 到 Docker Hub 搜尋 image  |

---

## 📥 建立 / 取得 Image

| 指令                              | 說明                      |
| ------------------------------- | ----------------------- |
| `docker pull REPO:TAG`          | 從遠端 Repository 下載 image |
| `docker commit CONTAINER IMAGE` | 以容器建立新的 image（包含容器狀態）   |
| `docker image load -i file.tar` | 匯入 *映象打包檔（含 metadata）*  |
| `docker import file.tar IMAGE`  | 匯入 *容器快照檔（無歷史、中繼資料）*    |

### 📝 輸入方式差異（重要）

| 指令                 | 來源        | 是否包含歷史 Layer | 是否含 metadata |
| ------------------ | --------- | ------------ | ------------ |
| `save -> load`     | Image     | ✔️ **有**     | ✔️ 有         |
| `export -> import` | Container | ❌ 無          | ❌ 無          |

---

# 📤 匯出 / 匯入

## 💾 映象打包（Image Save）

| 指令                                      | 說明           |
| --------------------------------------- | ------------ |
| `docker image save -o my.tar IMAGE`     | 輸出成映象打包檔     |
| `docker save -o my.tar IMAGE`           | 同上           |
| `docker save IMAGE > my.tar`            | 使用 redirect  |
| `docker save IMAGE \| zip my.tar.zip -` | 匯出後直接壓縮成 zip |

---

## 📥 載入映象打包（Image Load）

| 指令                                      | 說明           |
| --------------------------------------- | ------------ |
| `docker image load -i my.tar`           | 從 tar 匯入     |
| `docker load < my.tar`                  | 同上（redirect） |
| `unzip my.tar.zip \| docker image load` | 解壓並載入        |

---

# 📦 Docker Container（容器）

## 📋 Container 管理

| 指令                         | 說明           |
| -------------------------- | ------------ |
| `docker ps`                | 列出正在執行的容器    |
| `docker ps -a`             | 列出全部容器（包含停止） |
| `docker inspect CONTAINER` | 查看容器詳細資訊     |
| `docker rm CONTAINER`      | 刪除容器         |
| `docker stop CONTAINER`    | 停止容器         |
| `docker start CONTAINER`   | 啟動停止的容器      |

---

## ▶️ 建立 / 執行容器

| 指令                                    | 說明               |
| ------------------------------------- | ---------------- |
| `docker run IMAGE`                    | **建立並啟動容器**（最常用） |
| `docker create IMAGE`                 | 只建立但不啟動          |
| `docker exec -it CONTAINER /bin/bash` | 進入容器（推薦）         |
| `docker attach CONTAINER`             | 接上主程序（不常用）       |

---

## 🔧 進階操作

| 指令                                              | 說明                   |
| ----------------------------------------------- | -------------------- |
| `docker logs CONTAINER`                         | 查看容器應用程式輸出           |
| `docker port CONTAINER`                         | 查看容器 port 對映         |
| `docker inspect --format "{{ .State.Pid }}" ID` | 查容器主程序 PID           |
| `nsenter -t PID -n`                             | 進入容器 Namespace（高階用法） |

---

# 🏛 Repository（貯藏庫）

| 指令                                   | 說明                    |
| ------------------------------------ | --------------------- |
| `docker push IMAGE`                  | 上傳 image 到 Repository |
| `docker pull IMAGE`                  | 從 Repository 下載 image |
| `docker image tag IMAGE_ID repo:tag` | 將 image 重新命名 / 標記     |

---

# 🧹 系統清理

```bash
docker rm $(docker ps -a -q)      # 刪除所有容器
docker rmi $(docker images -a -q) # 刪除所有 image
```

⚠️ **非常危險：會清空所有容器與映象**

---

# 🚀 常用快速指令

### 進入容器 Shell

```bash
docker exec -it <container> /bin/bash
```

### 查看 Docker 版本

```bash
docker version
```

### 最常用查看 image

```bash
docker image ls
```

