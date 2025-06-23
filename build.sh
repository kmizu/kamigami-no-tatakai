#!/bin/bash

# 神々の闘い - ビルドスクリプト
# 使い方: ./build.sh [コマンド]

set -e  # エラーが発生したら即座に終了

# カラー出力の設定
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ヘルプメッセージ
show_help() {
    echo "神々の闘い - ビルドスクリプト"
    echo ""
    echo "使い方: ./build.sh [コマンド]"
    echo ""
    echo "コマンド:"
    echo "  install    - 依存パッケージをインストール"
    echo "  serve      - 開発サーバーを起動 (http://127.0.0.1:8000)"
    echo "  build      - 静的サイトをビルド"
    echo "  preview    - ビルド済みサイトをプレビュー"
    echo "  clean      - ビルド成果物を削除"
    echo "  deploy     - GitHub Pagesにデプロイ"
    echo "  help       - このヘルプを表示"
    echo ""
}

# 依存パッケージのインストール
install_deps() {
    echo -e "${YELLOW}依存パッケージをインストールしています...${NC}"
    
    # Pythonバージョンチェック
    python_version=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    required_version="3.8"
    
    if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" != "$required_version" ]; then 
        echo -e "${RED}エラー: Python $required_version 以上が必要です（現在: $python_version）${NC}"
        exit 1
    fi
    
    # 仮想環境の作成（存在しない場合）
    if [ ! -d "venv" ]; then
        echo -e "${GREEN}仮想環境を作成しています...${NC}"
        python3 -m venv venv
    fi
    
    # 仮想環境のアクティベート
    source venv/bin/activate
    
    # pipのアップグレード
    pip install --upgrade pip
    
    # 依存パッケージのインストール
    pip install -r requirements.txt
    
    echo -e "${GREEN}インストール完了！${NC}"
}

# 開発サーバーの起動
serve() {
    echo -e "${YELLOW}開発サーバーを起動しています...${NC}"
    echo -e "${GREEN}ブラウザで http://127.0.0.1:8000 を開いてください${NC}"
    
    # 仮想環境のアクティベート
    if [ -d "venv" ]; then
        source venv/bin/activate
    fi
    
    mkdocs serve
}

# サイトのビルド
build() {
    echo -e "${YELLOW}サイトをビルドしています...${NC}"
    
    # 仮想環境のアクティベート
    if [ -d "venv" ]; then
        source venv/bin/activate
    fi
    
    # 既存のビルドディレクトリを削除
    if [ -d "site" ]; then
        rm -rf site
    fi
    
    mkdocs build --strict
    
    echo -e "${GREEN}ビルド完了！${NC}"
    echo "ビルド済みファイルは site/ ディレクトリにあります"
}

# ビルド済みサイトのプレビュー
preview() {
    echo -e "${YELLOW}ビルド済みサイトをプレビューしています...${NC}"
    
    if [ ! -d "site" ]; then
        echo -e "${RED}エラー: site/ ディレクトリが見つかりません${NC}"
        echo "先に './build.sh build' を実行してください"
        exit 1
    fi
    
    # Pythonの簡易HTTPサーバーを使用
    cd site
    echo -e "${GREEN}ブラウザで http://localhost:8080 を開いてください${NC}"
    python3 -m http.server 8080
}

# クリーンアップ
clean() {
    echo -e "${YELLOW}ビルド成果物を削除しています...${NC}"
    
    if [ -d "site" ]; then
        rm -rf site
        echo "site/ ディレクトリを削除しました"
    fi
    
    if [ -d ".cache" ]; then
        rm -rf .cache
        echo ".cache/ ディレクトリを削除しました"
    fi
    
    # __pycache__ ディレクトリも削除
    find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
    
    echo -e "${GREEN}クリーンアップ完了！${NC}"
}

# GitHub Pagesへのデプロイ
deploy() {
    echo -e "${YELLOW}GitHub Pagesにデプロイしています...${NC}"
    
    # 仮想環境のアクティベート
    if [ -d "venv" ]; then
        source venv/bin/activate
    fi
    
    # Gitリポジトリかチェック
    if [ ! -d ".git" ]; then
        echo -e "${RED}エラー: Gitリポジトリではありません${NC}"
        echo "先に 'git init' を実行してください"
        exit 1
    fi
    
    mkdocs gh-deploy --force
    
    echo -e "${GREEN}デプロイ完了！${NC}"
}

# メイン処理
case "$1" in
    install)
        install_deps
        ;;
    serve)
        serve
        ;;
    build)
        build
        ;;
    preview)
        preview
        ;;
    clean)
        clean
        ;;
    deploy)
        deploy
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        if [ -z "$1" ]; then
            echo -e "${RED}エラー: コマンドが指定されていません${NC}"
        else
            echo -e "${RED}エラー: 不明なコマンド '$1'${NC}"
        fi
        echo ""
        show_help
        exit 1
        ;;
esac