from fastapi.testclient import TestClient


def test_health_check(client: TestClient):
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_create_and_get_item(client: TestClient):
    create_response = client.post("/items", json={"name": "apple", "description": "fruit"})
    assert create_response.status_code == 201
    created = create_response.json()
    assert created["name"] == "apple"

    get_response = client.get(f"/items/{created['id']}")
    assert get_response.status_code == 200
    assert get_response.json() == created


def test_get_item_not_found(client: TestClient):
    response = client.get("/items/does-not-exist")
    assert response.status_code == 404


def test_list_items(client: TestClient):
    client.post("/items", json={"name": "apple"})
    client.post("/items", json={"name": "banana"})

    response = client.get("/items")
    assert response.status_code == 200
    assert len(response.json()) == 2


def test_update_item(client: TestClient):
    created = client.post("/items", json={"name": "apple"}).json()

    response = client.patch(f"/items/{created['id']}", json={"description": "updated"})
    assert response.status_code == 200
    assert response.json()["description"] == "updated"


def test_delete_item(client: TestClient):
    created = client.post("/items", json={"name": "apple"}).json()

    delete_response = client.delete(f"/items/{created['id']}")
    assert delete_response.status_code == 204

    get_response = client.get(f"/items/{created['id']}")
    assert get_response.status_code == 404
