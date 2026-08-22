from datetime import date

from pydantic import BaseModel, Field, field_validator

_MAIL_PATTERN = r"^[^@\s]+@[^@\s]+\.[^@\s]+$"


class AccountCreate(BaseModel):
    model_config = {"populate_by_name": True}

    name: str = Field(..., min_length=1, max_length=100)
    mail: str = Field(..., min_length=1, max_length=254, pattern=_MAIL_PATTERN)
    tel: str = Field(..., min_length=1, max_length=20)
    date_of_birth: date = Field(..., alias="dateOfBirth")

    @field_validator("date_of_birth")
    @classmethod
    def validate_not_future(cls, value: date) -> date:
        if value > date.today():
            raise ValueError("dateOfBirth must not be in the future")
        return value


class Account(BaseModel):
    model_config = {"populate_by_name": True}

    account_id: str
    name: str
    mail: str
    tel: str
    date_of_birth: date = Field(..., alias="dateOfBirth")
