from typing import Iterable, Optional

from azure.cosmos import ContainerProxy, CosmosClient, PartitionKey
from azure.cosmos.exceptions import CosmosResourceNotFoundError

from app.core.config import Settings


class CosmosRepository:
    """CosmosDBの単一コンテナに対する汎用CRUDリポジトリ。"""

    def __init__(self, settings: Settings, container_name: Optional[str] = None):
        self._settings = settings
        self._container_name = container_name or settings.cosmos_container
        self._client: Optional[CosmosClient] = None
        self._container: Optional[ContainerProxy] = None

    def _get_container(self) -> ContainerProxy:
        if self._container is None:
            if self._client is None:
                self._client = CosmosClient(
                    url=self._settings.cosmos_endpoint,
                    credential=self._settings.cosmos_key,
                    connection_verify=self._settings.cosmos_connection_verify,
                )
            database = self._client.create_database_if_not_exists(
                id=self._settings.cosmos_database
            )
            self._container = database.create_container_if_not_exists(
                id=self._container_name,
                partition_key=PartitionKey(path="/id"),
            )
        return self._container

    def create_item(self, body: dict) -> dict:
        return self._get_container().create_item(body=body)

    def get_item(self, item_id: str) -> Optional[dict]:
        try:
            return self._get_container().read_item(item=item_id, partition_key=item_id)
        except CosmosResourceNotFoundError:
            return None

    def list_items(self) -> Iterable[dict]:
        return list(self._get_container().read_all_items())

    def upsert_item(self, body: dict) -> dict:
        return self._get_container().upsert_item(body=body)

    def delete_item(self, item_id: str) -> bool:
        try:
            self._get_container().delete_item(item=item_id, partition_key=item_id)
            return True
        except CosmosResourceNotFoundError:
            return False
