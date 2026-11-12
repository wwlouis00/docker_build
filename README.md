# 🐳 Docker 開發環境模板（正式可用版）

這個專案現在已經整理成可以直接拿來當作開發環境模板的做法。它具備以下特點：

- 可重複建置（Dockerfile + compose）
- 可跨機器使用（透過 `.env` 控制路徑與使用者）
- 以非 root 使用者執行，降低風險
- 可立即啟動，不需要額外手動修正掛載路徑
- 可透過 Makefile 直接管理容器

## 目錄結構

```text
.
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── .env.example
├── .dockerignore
├── README.md
├── workspace/
└── .env
```

## 快速開始

1. 複製環境設定：

```bash
cp .env.example .env
```

2. 修改`.env`中的 `HOST_WORKDIR`、`HOST_PORT` 等設定：

```bash
USERNAME=wwlouis
USER_UID=1000
USER_GID=1000
HOST_WORKDIR=./workspace
HOST_PORT=8080
```

3. 啟動容器：

```bash
make up
```

4. 進入容器：

```bash
make shell
```

5. 停止容器：

```bash
make down
```

## 常用指令

```bash
make up
make rebuild
make logs
make shell
make down
make clean
```

## 安全與可維護性重點

- Container 以 `${USERNAME}` 之非 root 使用者執行
- Dockerfile 使用 `--no-install-recommends`，減少映像大小
- `.dockerignore` 避免不必要的檔案被打包進映像
- `.env` 保持機器屬性設定，避免寫死 `H:/...`、`C:/...` 等路徑
- port 與工作目錄都可使用環境變數管理

## 版本與依賴

- Ubuntu 22.04
- Docker Compose v3.9
- 支援的開發模式：Python / Shell / C / 基本 CLI 工具

## 進階建議

如果這個模板要用在正式專案，可以再加上：

- `requirements.txt` 或 `poetry.lock`
- `Makefile` 內增加 `test`、`lint`、`format` 指令
- `docker-compose.override.yml` 分開開發與生產設定
- 監控與日誌卷宗管理

---

# 原始 Docker 指令整理

## 進入容器

```bash
docker compose exec dev /bin/bash
```

## 查看狀態

```bash
docker compose ps
docker compose logs -f
```

## 清理

```bash
docker compose down --volumes --remove-orphans
```

> ⚠️ 若你要全部刪除本機 docker 資源，請額外使用 `docker system prune -f`。
