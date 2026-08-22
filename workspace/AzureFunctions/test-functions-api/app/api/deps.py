from functools import lru_cache

from app.core.config import get_settings
from app.infrastructure.cosmos_client import CosmosRepository
from app.infrastructure.graph_client import GraphClient
from app.infrastructure.mail_sender import MailSender
from app.services.account_service import AccountService
from app.services.item_service import ItemService


@lru_cache
def get_item_service() -> ItemService:
    settings = get_settings()
    repository = CosmosRepository(settings)
    return ItemService(repository)


@lru_cache
def get_account_service() -> AccountService:
    settings = get_settings()
    repository = CosmosRepository(settings, container_name=settings.cosmos_account_container)
    return AccountService(repository)


@lru_cache
def get_mail_sender() -> MailSender:
    settings = get_settings()
    graph_client = GraphClient(settings)
    return MailSender(settings, graph_client)
