# 神々の闘い

ヤハウェと弥勒菩薩が救済を巡って激突する神話バトルライトノベル

## 概要

終末の時、二つの救済思想が激突する。選民思想のヤハウェと全員救済の弥勒菩薩。神々の議論バトルに巻き込まれた人類の運命は？

- 全20話（約10万字）
- バトル要素とコメディ要素満載
- MkDocs形式で構築

## セットアップ

### 必要な環境

- Python 3.8以上
- pip

### インストール

```bash
# リポジトリのクローン
git clone https://github.com/yourusername/kamigami-no-tatakai.git
cd kamigami-no-tatakai

# 仮想環境の作成（推奨）
python -m venv venv
source venv/bin/activate  # Windowsの場合: venv\Scripts\activate

# 依存パッケージのインストール
pip install -r requirements.txt
```

### ビルドと実行

```bash
# 開発サーバーの起動
./build.sh serve

# 静的サイトのビルド
./build.sh build

# ビルドしたサイトをローカルで確認
./build.sh preview
```

## プロジェクト構造

```
kamigami-no-tatakai/
├── mkdocs.yml          # MkDocs設定ファイル
├── docs/               # ドキュメントソース
│   ├── index.md       # トップページ
│   ├── characters.md  # 登場人物紹介
│   ├── part1/         # 第1部：邂逅編
│   ├── part2/         # 第2部：激論編
│   └── part3/         # 第3部：決戦編
├── site/              # ビルド済みサイト（自動生成）
├── requirements.txt   # Python依存パッケージ
├── setup.py          # Pythonパッケージ設定
├── build.sh          # ビルドスクリプト
└── README.md         # このファイル
```

## 開発

### ローカルでの編集

1. `mkdocs serve` でローカルサーバーを起動
2. `http://127.0.0.1:8000` でプレビュー
3. ファイルを編集すると自動的にリロード

### 新しい章の追加

1. `docs/` 以下に新しいMarkdownファイルを作成
2. `mkdocs.yml` のナビゲーションに追加
3. ビルドして確認

## デプロイ

### GitHub Pages（自動デプロイ）

このプロジェクトはGitHub Actionsを使用して自動デプロイが設定されています。

1. **初回設定**
   - GitHubリポジトリの Settings > Pages へ移動
   - Source を「GitHub Actions」に設定

2. **自動デプロイ**
   - `main`または`master`ブランチにプッシュすると自動的にデプロイ
   - 手動実行も可能（Actions タブから）

3. **手動デプロイ**
   ```bash
   # GitHub Pagesへの手動デプロイ
   mkdocs gh-deploy
   ```

### 静的ホスティング

```bash
# サイトをビルド
./build.sh build

# site/ ディレクトリの内容をホスティングサービスにアップロード
```

### リリース

タグをプッシュすると自動的にリリースが作成されます：

```bash
# バージョンタグを作成
git tag v1.0.0
git push origin v1.0.0
```

### その他のホスティングサービス

#### Netlify
1. Netlifyにログイン
2. GitHubリポジトリを接続
3. デプロイ設定は自動で認識されます（netlify.toml）

#### Vercel
1. Vercelにログイン
2. GitHubリポジトリをインポート
3. デプロイ設定は自動で認識されます（vercel.json）

## GitHub Actions

このプロジェクトには以下のワークフローが設定されています：

- **Deploy**: メインブランチへのプッシュで自動デプロイ
- **CI**: プルリクエストでのビルドチェック
- **Release**: タグプッシュで自動リリース作成
- **Check Links**: 週次でのリンクチェック
- **Dependabot**: 依存関係の自動更新

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## 作者

- 原作：[あなたの名前]
- 協力：Claude（AI）

## 謝辞

神々の闘いを最後まで見守ってくださった読者の皆様に感謝します。

---

*さあ、神々の闘いの目撃者となれ。*