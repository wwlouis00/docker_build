# 🐳 Docker 指令大全（完整整理版）

> 這個專案目前重點是「Docker 研究／開發環境整理」，不強制使用 root 權限，並且以更安全的方式設定 Compose。若你要直接使用，請先複製 `.env.example` 成 `.env`，再修改 `HOST_WORKDIR` 與其他環境變數。

## 快速開始

```bash
cp .env.example .env
docker compose up -d
```

## 安全更新重點

- 已移除 `docker-compose.yml` 中的 root 權限覆寫。
- 以環境變數控制映像、容器名稱與掛載目錄，降低跨機器不相容問題。
- 安裝腳本改用 Docker 官方 GPG 金鑰與新版 apt repository，避免舊版 `apt-key` 方式。
- Dockerfile 僅保留必要工具，減少映像大小與攻擊面。

## 常用 Docker 指令

```bash
docker ps
docker logs <container>
docker exec -it <container> /bin/bash
docker image ls
docker compose down
docker compose logs -f
```

## 系統清理

```bash
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)
```

> ⚠️ 這會刪除所有容器與映像，請在確認後再執行。

## 目錄

- [`Dockerfile`](Dockerfile)
- [`docker-compose.yml`](docker-compose.yml)
- [`docker-install.txt.sh`](docker-install.txt.sh)
- [`.env.example`](.env.example)

---

# 🖼️ Docker Image（映象）

## 📋 Image 基本指令

| 指令 | 說明 |
| --- | --- |
| `docker images` | 列出本地所有 images |
| `docker image ls` | 新寫法（正式） |
| `docker image inspect IMAGE` | 查看 image 詳細 metadata |
| `docker image history IMAGE` | 查看建立流程與每層 Layer 歷史 |
| `docker rmi IMAGE` | 刪除 image |
| `docker search KEYWORD` | 到 Docker Hub 搜尋 image |

## 📥 建立 / 取得 Image

| 指令 | 說明 |
| --- | --- |
| `docker pull REPO:TAG` | 從遠端 Repository 下載 image |
| `docker commit CONTAINER IMAGE` | 以容器建立新的 image |
| `docker image load -i file.tar` | 匯入映象打包檔 |
| `docker import file.tar IMAGE` | 匯入容器快照檔 |

## 📤 匯出 / 匯入

| 指令 | 說明 |
| --- | --- |
| `docker image save -o my.tar IMAGE` | 輸出成映象打包檔 |
| `docker image load -i my.tar` | 從 tar 匯入 |
| `docker save IMAGE > my.tar` | 輸出成 tar |

# 📦 Docker Container（容器）

## 📋 Container 管理

| 指令 | 說明 |
| --- | --- |
| `docker ps` | 列出正在執行的容器 |
| `docker ps -a` | 列出全部容器（包含停止） |
| `docker inspect CONTAINER` | 查看容器詳細資訊 |
| `docker rm CONTAINER` | 刪除容器 |
| `docker stop CONTAINER` | 停止容器 |
| `docker start CONTAINER` | 啟動停止的容器 |

## ▶️ 建立 / 執行容器

| 指令 | 說明 |
| --- | --- |
| `docker run IMAGE` | 建立並啟動容器 |
| `docker create IMAGE` | 只建立但不啟動 |
| `docker exec -it CONTAINER /bin/bash` | 進入容器 |

## 🔧 進階操作

| 指令 | 說明 |
| --- | --- |
| `docker logs CONTAINER` | 查看容器輸出 |
| `docker inspect --format "{{ .State.Pid }}" ID` | 查容器主程序 PID |
| `docker compose up -d` | 啟動 compose 服務 |
| `docker compose down` | 停止並移除 compose 服務 |

---

# 🏛 Repository（貯藏庫）

| 指令 | 說明 |
| --- | --- |
| `docker push IMAGE` | 上傳 image 到 Repository |
| `docker pull IMAGE` | 從 Repository 下載 image |
| `docker image tag IMAGE_ID repo:tag` | 將 image 重新命名 / 標記 |

---

# 🚀 常用快速指令

```bash
docker version
docker compose version
docker image ls
docker exec -it <container> /bin/bash
```
