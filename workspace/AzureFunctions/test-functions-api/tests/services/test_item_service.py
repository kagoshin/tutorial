from app.models.item import ItemCreate, ItemUpdate
from app.services.item_service import ItemService
from tests.conftest import FakeCosmosRepository


def test_create_item():
    service = ItemService(FakeCosmosRepository())

    item = service.create_item(ItemCreate(name="apple", description="fruit"))

    assert item.name == "apple"
    assert item.description == "fruit"
    assert item.id


def test_get_item_returns_none_when_missing():
    service = ItemService(FakeCosmosRepository())

    assert service.get_item("missing") is None


def test_update_item_merges_fields():
    service = ItemService(FakeCosmosRepository())
    created = service.create_item(ItemCreate(name="apple"))

    updated = service.update_item(created.id, ItemUpdate(description="tasty"))

    assert updated is not None
    assert updated.name == "apple"
    assert updated.description == "tasty"


def test_delete_item():
    service = ItemService(FakeCosmosRepository())
    created = service.create_item(ItemCreate(name="apple"))

    assert service.delete_item(created.id) is True
    assert service.delete_item(created.id) is False
