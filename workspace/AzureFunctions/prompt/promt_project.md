以下の**環境**内に、**スタック構成**、**クラス構成**で、**フォルダ**直下にローカル開発環境を構築したい。
プロジェクトを作成してください。

# 環境
- クラウド環境 : Azure
- DB : CosmosDB
- 認証基盤 : Entra External ID
- フロントエンド : React

# スタック構成
- サーバレスアーキテクチャ : AzureFunctions
- 言語 : python
- フレームワーク : Fast API
- 単体テスト : pytest
- カバレッジ : coverage.py
- DocumentDB : CosmosDB
- OpenAPI : Swagger

# クラス構成
- API、サービス、インフラストラクチャ層を分ける３層構造
- インフラストラクチャには、DB接続、GraphAPI、メール送信などの処理を持つ。

# フォルダ
- tutorial/workspace/AzureFunctions/test-functions-api