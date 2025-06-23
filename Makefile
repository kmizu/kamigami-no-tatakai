# 神々の闘い - Makefile
# 便利なコマンドをまとめたMakefile

.PHONY: help install serve build preview clean deploy test

# デフォルトターゲット
help:
	@echo "神々の闘い - 利用可能なコマンド:"
	@echo ""
	@echo "  make install    - 依存パッケージをインストール"
	@echo "  make serve      - 開発サーバーを起動"
	@echo "  make build      - 静的サイトをビルド"
	@echo "  make preview    - ビルド済みサイトをプレビュー"
	@echo "  make clean      - ビルド成果物を削除"
	@echo "  make deploy     - GitHub Pagesにデプロイ"
	@echo "  make test       - リンクチェックを実行"
	@echo ""

# 依存パッケージのインストール
install:
	@./build.sh install

# 開発サーバーの起動
serve:
	@./build.sh serve

# サイトのビルド
build:
	@./build.sh build

# ビルド済みサイトのプレビュー
preview:
	@./build.sh preview

# クリーンアップ
clean:
	@./build.sh clean

# GitHub Pagesへのデプロイ
deploy:
	@./build.sh deploy

# リンクチェック（オプション）
test: build
	@echo "リンクチェックを実行しています..."
	@python -m http.server 8888 --directory site &
	@sleep 2
	@wget --spider -r -nd -nv -H -l 2 -w 1 -o /tmp/wget.log http://localhost:8888 || true
	@pkill -f "python -m http.server 8888"
	@echo "リンクチェック完了"