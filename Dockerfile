FROM python:3.13-slim

WORKDIR /docs

# システムパッケージの更新とgitのインストール（gh-deployに必要）
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# 依存関係のインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクトファイルのコピー
COPY . .

# ポート開放
EXPOSE 8000

# デフォルトコマンド
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]