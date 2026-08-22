import uuid

from app.infrastructure.cosmos_client import CosmosRepository
from app.models.account import Account, AccountCreate


class AccountService:
    """Accountドメインのビジネスロジック。Infrastructure層(CosmosRepository)を利用する。"""

    def __init__(self, repository: CosmosRepository):
        self._repository = repository

    def create_account(self, data: AccountCreate) -> Account:
        account_id = str(uuid.uuid4())
        doc = {
            "id": account_id,
            "account_id": account_id,
            "name": data.name,
            "mail": data.mail,
            "tel": data.tel,
            "dateOfBirth": data.date_of_birth.isoformat(),
        }
        created = self._repository.create_item(doc)
        return Account(**created)
