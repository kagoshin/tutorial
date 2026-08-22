from functools import lru_cache
from typing import Optional

import jwt
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from jwt import PyJWKClient

from app.core.config import Settings, get_settings

_bearer_scheme = HTTPBearer(auto_error=False)


class EntraTokenValidator:
    """Entra External ID (CIAM) が発行したアクセストークンを検証する。"""

    def __init__(self, settings: Settings):
        self._settings = settings
        self._jwks_client: Optional[PyJWKClient] = None

    @property
    def _issuer_base(self) -> str:
        subdomain = self._settings.entra_tenant_subdomain
        tenant_id = self._settings.entra_tenant_id
        return f"https://{subdomain}.ciamlogin.com/{tenant_id}"

    @property
    def _jwks_uri(self) -> str:
        flow = self._settings.entra_user_flow
        path = f"/{flow}/v2.0" if flow else "/v2.0"
        return f"{self._issuer_base}{path}/.well-known/openid-configuration/jwks"

    def _get_jwks_client(self) -> PyJWKClient:
        if self._jwks_client is None:
            self._jwks_client = PyJWKClient(self._jwks_uri)
        return self._jwks_client

    def validate(self, token: str) -> dict:
        if not self._settings.entra_tenant_id or not self._settings.entra_client_id:
            raise HTTPException(
                status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
                detail="Entra External ID の設定 (ENTRA_TENANT_ID / ENTRA_CLIENT_ID) が未構成です。",
            )
        try:
            signing_key = self._get_jwks_client().get_signing_key_from_jwt(token)
            claims = jwt.decode(
                token,
                signing_key.key,
                algorithms=["RS256"],
                audience=self._settings.entra_client_id,
            )
        except jwt.PyJWTError as exc:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail=f"トークンの検証に失敗しました: {exc}",
            ) from exc
        return claims


@lru_cache
def get_token_validator() -> EntraTokenValidator:
    return EntraTokenValidator(get_settings())


def get_current_user(
    credentials: Optional[HTTPAuthorizationCredentials] = Depends(_bearer_scheme),
    validator: EntraTokenValidator = Depends(get_token_validator),
) -> dict:
    if credentials is None:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Authorization ヘッダーが必要です。",
        )
    return validator.validate(credentials.credentials)
