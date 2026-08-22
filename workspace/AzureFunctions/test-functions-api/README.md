# AzureFunctions ローカル開発環境

Azure Functions（Python）上で FastAPI を動かすサーバレスAPIのプロジェクト。`../prompt/promt_project.md` の仕様に基づく。

## 環境・スタック

- クラウド環境: Azure（サーバレス: Azure Functions）
- 言語/フレームワーク: Python + FastAPI
- DB: CosmosDB
- 認証基盤: Entra External ID
- 単体テスト: pytest / カバレッジ: coverage.py
- OpenAPI: Swagger（FastAPI標準機能）

## アーキテクチャ（3層構造）

```
app/
├── api/            # API層: FastAPIルーター（コントローラ）、DI設定
├── services/       # Service層: ビジネスロジック
├── infrastructure/ # Infrastructure層: CosmosDB接続、GraphAPI、メール送信
├── core/           # 設定(config.py)、Entra External ID認証(auth.py)
└── models/         # Pydanticスキーマ
```

3層構造の使い方を示すサンプルとして `Item` の簡易CRUD（`app/api/routes/items.py` → `app/services/item_service.py` → `app/infrastructure/cosmos_client.py`）を実装している。実際の業務ドメインに合わせて置き換えること。

`function_app.py` が Azure Functions の Python v2 programming model エントリポイントで、`azure.functions.AsgiFunctionApp` により `app/main.py` の FastAPI インスタンスをそのままホストする。`host.json` で `routePrefix` を空にしているため、FastAPI のパス（`/items`, `/docs` など）がそのまま公開される。

## セットアップ

前提ツール（Homebrewで導入済み）: `azure-functions-core-tools@4`（`func`）, `node`, `azure-cli`（`az`）

```bash
cd AzureFunctions/test-functions-api
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements-dev.txt
```

`local.settings.json` は `local.settings.json.sample` をコピーして作成済み（gitignore対象）。CosmosDB / Entra External ID / Microsoft Graph の接続情報は未設定でも起動はできるが、値が必要な機能（実際のDB/Graph呼び出し）は接続情報を設定するまで利用できない。実際のAzureリソース・アプリ登録の値を埋めること。

## ローカル実行

```bash
source .venv/bin/activate
func start
```

- Swagger UI: http://localhost:7071/docs
- OpenAPI定義: http://localhost:7071/openapi.json
- ヘルスチェック: http://localhost:7071/health

`AzureWebJobsStorage` はローカル既定で `UseDevelopmentStorage=true`（Azurite）を指定しているが、HTTPトリガーのみの動作確認では未起動でも支障はない。ストレージ機能を使う場合は `azurite`（`npm install -g azurite` 等）を別途起動すること。

## テスト・カバレッジ

```bash
source .venv/bin/activate
coverage run -m pytest -v
coverage report
```

API層のテストは `tests/api/`、Service層のテストは `tests/services/` に配置。CosmosDB/Graph APIはインメモリのフェイク実装（`tests/conftest.py`）に差し替えてテストしており、実Azureリソースへの接続は不要。

## 未設定・今後の対応

- Entra External ID: 実テナントでのアプリ登録（API用・Graph用）が必要。値は `local.settings.json` の `ENTRA_*` / `GRAPH_*` に設定する。
- CosmosDB: 実アカウントの `COSMOS_ENDPOINT` / `COSMOS_KEY` を設定する。ローカルでCosmos DB Emulatorを使う場合は別途Dockerでの起動が必要。
- Reactフロントエンドの雛形は今回のスコープ外（別途対応）。
