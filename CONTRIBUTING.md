# 貢献ガイドライン

「神々の闘い」プロジェクトへの貢献を検討していただき、ありがとうございます！

## 貢献の方法

### バグ報告
- バグを見つけたら、[Issues](https://github.com/yourusername/kamigami-no-tatakai/issues)で報告してください
- 既存のIssueがないか確認してください
- バグ報告テンプレートを使用してください

### 機能提案
- 新機能のアイデアがあれば、Issueで提案してください
- 機能リクエストテンプレートを使用してください

### プルリクエスト
1. リポジトリをフォーク
2. 機能ブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## 開発環境のセットアップ

```bash
# リポジトリをクローン
git clone https://github.com/yourusername/kamigami-no-tatakai.git
cd kamigami-no-tatakai

# 仮想環境を作成
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 依存関係をインストール
pip install -r requirements.txt

# 開発サーバーを起動
mkdocs serve
```

## コーディング規約

### Markdown
- 見出しは適切な階層で使用
- 日本語の文章は読みやすく
- コードブロックには言語を指定

### コミットメッセージ
- 日本語または英語で明確に
- 変更内容が分かるように
- 例: `第15話の誤字を修正` または `Fix typo in chapter 15`

### ブランチ名
- `feature/` - 新機能
- `fix/` - バグ修正
- `docs/` - ドキュメント更新

## テスト

プルリクエストを送る前に以下を確認：

```bash
# ビルドが成功するか
mkdocs build --strict

# リンクチェック（オプション）
pip install linkchecker
mkdocs serve &
linkchecker http://localhost:8000
```

## ライセンス

貢献していただいたコンテンツは、プロジェクトと同じMITライセンスで公開されます。

## 質問

質問がある場合は、Issueで気軽に聞いてください！

ありがとうございます！ 🙏