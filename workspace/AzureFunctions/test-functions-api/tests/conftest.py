from typing import Iterable, Optional

import pytest
from fastapi.testclient import TestClient

from app.api.deps import get_account_service, get_item_service
from app.core.auth import get_current_user
from app.main import app as fastapi_app
from app.services.account_service import AccountService
from app.services.item_service import ItemService


class FakeCosmosRepository:
    """CosmosRepositoryと同じインターフェースを持つインメモリのフェイク実装。"""

    def __init__(self):
        self._store: dict = {}

    def create_item(self, body: dict) -> dict:
        self._store[body["id"]] = body
        return body

    def get_item(self, item_id: str) -> Optional[dict]:
        return self._store.get(item_id)

    def list_items(self) -> Iterable[dict]:
        return list(self._store.values())

    def upsert_item(self, body: dict) -> dict:
        self._store[body["id"]] = body
        return body

    def delete_item(self, item_id: str) -> bool:
        return self._store.pop(item_id, None) is not None


@pytest.fixture
def fake_repository() -> FakeCosmosRepository:
    return FakeCosmosRepository()


@pytest.fixture
def fake_account_repository() -> FakeCosmosRepository:
    return FakeCosmosRepository()


@pytest.fixture
def client(
    fake_repository: FakeCosmosRepository,
    fake_account_repository: FakeCosmosRepository,
) -> Iterable[TestClient]:
    fastapi_app.dependency_overrides[get_item_service] = lambda: ItemService(fake_repository)
    fastapi_app.dependency_overrides[get_account_service] = lambda: AccountService(
        fake_account_repository
    )
    fastapi_app.dependency_overrides[get_current_user] = lambda: {"sub": "test-user"}
    with TestClient(fastapi_app) as test_client:
        yield test_client
    fastapi_app.dependency_overrides.clear()
