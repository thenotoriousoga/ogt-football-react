# Dockerfile

# 1. ベースイメージの指定 (Node.jsの最新LTS推奨)
FROM node:lts-alpine

# 2. 作業ディレクトリの設定
WORKDIR /app

# 3. パッケージ定義ファイルのコピーと依存関係のインストール
# COPY . をする前にインストールすることで、package.json/package-lock.jsonに変更がなければ
# 依存関係のインストールレイヤーをキャッシュできる
COPY package*.json ./

# 4. 依存関係のインストール
RUN npm install

# 5. すべてのソースコードをコンテナにコピー
COPY . .

# 6. 開発サーバーのポートを公開 (Viteのデフォルトは5173)
EXPOSE 5173

# 7. コンテナ起動時に実行するコマンド (開発サーバーの起動)
CMD ["npm", "run", "dev"]