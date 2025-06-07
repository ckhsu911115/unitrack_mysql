# 使用官方 MySQL 映像
FROM mysql:8.0

# 設定環境變數（你也可從 Render 設定介面設）
ENV MYSQL_ROOT_PASSWORD=unitrack2025
ENV MYSQL_DATABASE=unitrack_5
ENV MYSQL_USER=unitrack_user
ENV MYSQL_PASSWORD=unitrack_pass

# 把初始化 SQL 檔案複製進去
COPY ./initdb /docker-entrypoint-initdb.d/
