from typing import Optional

import httpx
import msal

from app.core.config import Settings

GRAPH_BASE_URL = "https://graph.microsoft.com/v1.0"
GRAPH_SCOPE = ["https://graph.microsoft.com/.default"]


class GraphClient:
    """アプリケーション権限（クライアントクレデンシャルフロー）でMicrosoft Graphを呼び出す。"""

    def __init__(self, settings: Settings):
        self._settings = settings
        self._confidential_app: Optional[msal.ConfidentialClientApplication] = None

    def _get_app(self) -> msal.ConfidentialClientApplication:
        if self._confidential_app is None:
            authority = f"https://login.microsoftonline.com/{self._settings.graph_tenant_id}"
            self._confidential_app = msal.ConfidentialClientApplication(
                client_id=self._settings.graph_client_id,
                client_credential=self._settings.graph_client_secret,
                authority=authority,
            )
        return self._confidential_app

    def _get_access_token(self) -> str:
        app = self._get_app()
        result = app.acquire_token_silent(GRAPH_SCOPE, account=None)
        if not result:
            result = app.acquire_token_for_client(scopes=GRAPH_SCOPE)
        if "access_token" not in result:
            error = result.get("error_description", result.get("error", "unknown error"))
            raise RuntimeError(f"Graph APIのトークン取得に失敗しました: {error}")
        return result["access_token"]

    def post(self, path: str, json: dict) -> httpx.Response:
        token = self._get_access_token()
        with httpx.Client(base_url=GRAPH_BASE_URL, timeout=10.0) as client:
            response = client.post(
                path,
                json=json,
                headers={"Authorization": f"Bearer {token}"},
            )
            response.raise_for_status()
            return response
