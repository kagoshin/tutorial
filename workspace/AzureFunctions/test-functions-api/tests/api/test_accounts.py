from fastapi.testclient import TestClient


def test_create_account(client: TestClient):
    response = client.post(
        "/accounts",
        json={
            "name": "山田太郎",
            "mail": "taro@example.com",
            "tel": "090-1234-5678",
            "dateOfBirth": "1990-01-01",
        },
    )

    assert response.status_code == 201
    body = response.json()
    assert body["account_id"]
    assert body["name"] == "山田太郎"
    assert body["mail"] == "taro@example.com"
    assert body["tel"] == "090-1234-5678"
    assert body["dateOfBirth"] == "1990-01-01"


def test_create_account_invalid_mail_returns_422(client: TestClient):
    response = client.post(
        "/accounts",
        json={
            "name": "山田太郎",
            "mail": "invalid-mail",
            "tel": "090-1234-5678",
            "dateOfBirth": "1990-01-01",
        },
    )

    assert response.status_code == 422


def test_create_account_missing_field_returns_422(client: TestClient):
    response = client.post(
        "/accounts",
        json={
            "name": "山田太郎",
            "mail": "taro@example.com",
            "tel": "090-1234-5678",
        },
    )

    assert response.status_code == 422
