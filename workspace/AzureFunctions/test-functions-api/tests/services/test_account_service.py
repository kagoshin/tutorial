from datetime import date

import pytest
from pydantic import ValidationError

from app.models.account import AccountCreate
from app.services.account_service import AccountService
from tests.conftest import FakeCosmosRepository


def test_create_account():
    service = AccountService(FakeCosmosRepository())

    account = service.create_account(
        AccountCreate(
            name="山田太郎",
            mail="taro@example.com",
            tel="090-1234-5678",
            dateOfBirth="1990-01-01",
        )
    )

    assert account.account_id
    assert account.name == "山田太郎"
    assert account.mail == "taro@example.com"
    assert account.tel == "090-1234-5678"
    assert account.date_of_birth == date(1990, 1, 1)


def test_account_create_rejects_invalid_mail():
    with pytest.raises(ValidationError):
        AccountCreate(
            name="山田太郎",
            mail="invalid-mail",
            tel="090-1234-5678",
            dateOfBirth="1990-01-01",
        )


def test_account_create_rejects_future_birthdate():
    with pytest.raises(ValidationError):
        AccountCreate(
            name="山田太郎",
            mail="taro@example.com",
            tel="090-1234-5678",
            dateOfBirth="2999-01-01",
        )
