這是一份完整的 Docker 參數整理筆記。我已將您提供的三個原始檔案內容整合，並在每一節後方附上**原始程式碼區塊**供您快速複製，同時針對各項參數做了詳細的解釋。

---

# 🐳 Docker 常用參數完整指南 (MD 筆記版)

本筆記整合了容器基礎設定、網路埠號對映、以及資料卷掛載的核心操作。

## 一、 基礎執行與環境設定 (General Options)

這部分參數定義了容器的運行模式、名稱以及系統環境。

* **`--name`**：自訂容器名稱，方便後續管理，避免使用系統隨機產生的名稱。
* **`-t`**：配置一個偽終端機 (pseudo-tty)。
* **`-i`**：保持標準輸入 (STDIN) 開啟，通常與 `-t` 連用以進行互動操作。
* **`-d`**：背景執行模式 (daemonized)，讓容器在後台運行。
* **`--rm`**：容器停止時自動刪除。注意：**不可與 `-d` 參數共用**。
* **`--link`**：連接另一個容器，格式為 `容器名稱:連接別名`，別名用於容器內部識別。
* **環境/時區**：
* `-e "TZ=Asia/Taipei"`：設定容器內的時區變數。
* `-v /etc/localtime:/etc/localtime:ro`：同步主機時區至容器並設為唯讀。



### 📄 原始程式碼複寫 (參數.txt.sh)

```bash
docker  run	參數
docker  create	參數
		--name：自訂容器名稱
		-t：pseudo-tty
		-i：標準輸入
		
		-d：daemonized
		--rm：容器停止時自動刪除，不可與 -d 共用
		
		--link：
		--link   欲連接的容器名稱:連接別名				# '連接別名' 是給連接容器識別的別名
		-v /etc/localtime:/etc/localtime:ro
	
		-e "TZ=Asia/Taipei"			#  timezone

```

---

## 二、 網路連接埠對映 (Port Mapping)

用於將主機的連接埠與容器內部的服務進行對接。

* **`-P` (大寫)**：自動隨機對映。Docker 會從主機的 `49000～49900` 埠號中隨機挑選，對映到容器開放的埠。
* **`-p` (小寫)**：指定對映方式。
* `8000:8000`：主機埠:容器埠。
* `ip:本機port:容器port`：指定特定 IP 進行對映。
* `ip::容器port`：指定 IP 但由系統自動分配本機埠號。
* `port/udp`：指定使用 UDP 傳輸協定（預設為 TCP）。



### 📄 原始程式碼複寫 (參數_port.txt.sh)

```bash
docker  run	參數
docker  create	參數
		-P：Docker 隨機從 49000～49900 對映到容器內開放的 port
		
		-p：指定對映 port
		-p：多個 -p 可多次指定對映 port
		-p  8000:8000
				
		-p  127.0.0.1:8080:80		            #    ip:本機的port:容器的port
		-p  127.0.0.1::80				                #    自動分配一個本機的port
		-p  127.0.0.1:8080:8000/udp		#  指定  udp  port

```

---

## 三、 資料卷掛載 (Data Volumes)

用於實現資料持久化或在容器與主機間共享檔案。

### 1. 使用 `-v` 掛載

* 可以同時使用多個 `-v` 掛載多個目錄。
* **自動建立**：若本機目錄不存在，系統會自動建立。
* **路徑規範**：本機可選相對或絕對路徑，但容器路徑必須是**絕對路徑**。
* **唯讀權限**：在路徑後方加上 `:ro` 可將掛載目錄設為唯讀。

### 2. 資料卷容器 (`--volumes-from`)

* 用於掛載另一個容器提供的目錄。
* 支援多個 `--volumes-from` 同時掛載。
* **特點**：來源容器即使處於**停止狀態**也可以被掛載。

### 📄 原始程式碼複寫 (參數_data_volume.txt.sh)

```bash
docker  run	參數
docker  create	參數
		-v：掛載 空的 data-volumes目錄，或從本機掛載 data-volumes目錄
		-v：多個 -v 可掛載多個 data-volumes目錄，本機目錄相對路徑或絕對路徑，目錄不存在會自動建，容器目錄則需絕對路徑
		-v  /containerDir
		-v  ~/src/hostDir:/opt/containerDir
		-v  本機目錄:/容器絕對路徑目錄
		-v  ~/src/hostDir:/opt/containerDir:ro			# 預設為可讀寫， :ro 修改為唯讀
		


data-volumes-container：一個提供自身目錄給其他容器掛載的容器

docker  run	參數
docker  create	參數
		--volumes-from：掛載其他容器的 data-volumes目錄
		--volumes-from：多個 --volumes-from 可掛載多個其他容器的 data-volumes目錄
		--volumes-from  容器名稱			#  容器可以是停止狀態
