# CosmosDB エミュレータ
- 再開 : docker start cosmosdb-emulator
- 停止/削除 : docker stop cosmosdb-emulator / docker rm cosmosdb-emulator
- コンテナは--detach起動
- 今後 func start で実際にAPIを叩けば、このエミュレータにデータが書き込まれます。

# 　Data Explorer(CosmosDB)
- URL: http://localhost:1234/
- AppDatabase データベース → Items コンテナを開くと、Items(ドキュメント)一覧・中身の閲覧・SQLクエリ実行・手動でのアイテム編集/削除ができます。

# Swagger UI
- 起動 : func start
- URL : http://localhost:7071/docs 

## 手順
- ターミナルでFunctionsホストを起動(既に起動済みです):
- cd tutorial/workspace/AzureFunctions/test-functions-api
- source .venv/bin/activate
- func start

- ブラウザで http://localhost:7071/docs を開く(Swagger UI)
- accountsタグを開き、POST /accountsをクリック → Try it out
- Request bodyに以下を入力して Execute:

{
  "name": "山田太郎",
  "mail": "taro@example.com",
  "tel": "090-1234-5678",
  "dateOfBirth": "1990-01-01"
}

- 201レスポンスでaccount_idが採番されたJSONが返れば成功

# Swagger
今のプロジェクトはFastAPIが自動でOpenAPI仕様(JSON)をコードから生成する「コードファースト」方式なので、YAMLファイルは今のところ存在しません。手動でOpenAPIのYAMLを書く「スペックファースト」に切り替えると、リクエスト/レスポンスの管理は次のように変わります。

paths配下の各エンドポイントに requestBody.content.application/json.schema と responses.<code>.content...schema を明示的に書く。今はapp/models/account.pyのPydanticモデルが自動でこの部分に変換されていますが、YAMLだとこの定義自体が唯一の正(single source of truth)になります。
components/schemasにAccountやAccountCreateを一度定義し、各エンドポイントから$refで参照すれば、重複なく使い回せます(例やバリデーションルールもここに書ける)。
実装より先にAPI設計を固めてレビュー・合意したり、フロントエンドやSDK生成(openapi-generatorなど)にYAMLだけ渡す、といった運用ができるようになります。
ただし主なトレードオフは「コードとの二重管理」です。今のコードファースト(FastAPI自動生成)なら実装とドキュメントが常に一致しますが、YAMLを手書きにすると実装とYAMLの乖離を防ぐ仕組み(contract test等)が別途必要になります。この規模のプロジェクトなら今のまま自動生成に任せる方がシンプルだと思いますが、外部チームとの設計合意が目的ならスペックファーストへの切り替えも検討価値ありです。

# フロントエンド連携
まだReactプロジェクト自体がこのワークスペースに存在しないようですね。前提として、今のコードファースト方式(FastAPIが自動生成する/openapi.json)を活かすなら、openapi-typescriptやorvalのようなコード生成ツールでOpenAPI仕様からTypeScriptの型・APIクライアントを自動生成するのがおすすめです。バックエンドの型定義(Pydanticモデル)をフロントが手動で書き写す必要がなくなり、エンドポイント追加・変更時も再生成コマンド一発で同期できます。

主なトレードオフは、フロントのビルド/開発フローに「バックエンドのOpenAPI仕様を取得→型生成」というステップが増える点です(ローカルならfunc startしているサーバーの/openapi.jsonを叩く、CI/デプロイ済みならデプロイ先のURLを叩く、といった取得元の運用が必要)。

この方向で進めるなら、具体的には次のような流れになります:

func startでAPIを起動した状態で http://localhost:7071/openapi.json から仕様を取得
Reactプロジェクト側で npx openapi-typescript http://localhost:7071/openapi.json -o src/types/api.d.ts のようなコマンドで型を生成
fetch/axios呼び出し側でその型を使う(あるいはorvalならAPIクライアント関数ごと自動生成)