from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """環境変数（local.settings.json の Values / 本番はAppSettings）から読み込む設定値。"""

    model_config = SettingsConfigDict(env_file=None, extra="ignore")

    # CosmosDB
    cosmos_endpoint: str = ""
    cosmos_key: str = ""
    cosmos_database: str = "AppDatabase"
    cosmos_container: str = "Items"

    # Entra External ID（APIを保護するトークン検証用）
    entra_tenant_subdomain: str = ""
    entra_tenant_id: str = ""
    entra_client_id: str = ""
    entra_user_flow: str = ""

    # Microsoft Graph（メール送信などに使用するアプリ登録）
    graph_tenant_id: str = ""
    graph_client_id: str = ""
    graph_client_secret: str = ""
    graph_sender_upn: str = ""


@lru_cache
def get_settings() -> Settings:
    return Settings()
