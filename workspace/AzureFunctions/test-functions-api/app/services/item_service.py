import uuid
from typing import List, Optional

from app.infrastructure.cosmos_client import CosmosRepository
from app.models.item import Item, ItemCreate, ItemUpdate


class ItemService:
    """Itemドメインのビジネスロジック。Infrastructure層(CosmosRepository)を利用する。"""

    def __init__(self, repository: CosmosRepository):
        self._repository = repository

    def list_items(self) -> List[Item]:
        return [Item(**doc) for doc in self._repository.list_items()]

    def get_item(self, item_id: str) -> Optional[Item]:
        doc = self._repository.get_item(item_id)
        return Item(**doc) if doc else None

    def create_item(self, data: ItemCreate) -> Item:
        doc = {"id": str(uuid.uuid4()), **data.model_dump()}
        created = self._repository.create_item(doc)
        return Item(**created)

    def update_item(self, item_id: str, data: ItemUpdate) -> Optional[Item]:
        existing = self._repository.get_item(item_id)
        if existing is None:
            return None
        updated_fields = data.model_dump(exclude_unset=True)
        merged = {**existing, **updated_fields}
        upserted = self._repository.upsert_item(merged)
        return Item(**upserted)

    def delete_item(self, item_id: str) -> bool:
        return self._repository.delete_item(item_id)
