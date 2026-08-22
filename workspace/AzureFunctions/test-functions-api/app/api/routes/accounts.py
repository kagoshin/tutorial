from fastapi import APIRouter, Depends, status

from app.api.deps import get_account_service
from app.models.account import Account, AccountCreate
from app.services.account_service import AccountService

router = APIRouter(prefix="/accounts", tags=["accounts"])


@router.post("", response_model=Account, status_code=status.HTTP_201_CREATED)
def create_account(
    data: AccountCreate,
    service: AccountService = Depends(get_account_service),
) -> Account:
    return service.create_account(data)
