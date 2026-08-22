from typing import List

from fastapi import APIRouter, Depends, HTTPException, status

from app.api.deps import get_item_service
from app.core.auth import get_current_user
from app.models.item import Item, ItemCreate, ItemUpdate
from app.services.item_service import ItemService

router = APIRouter(prefix="/items", tags=["items"])


@router.get("", response_model=List[Item])
def list_items(
    service: ItemService = Depends(get_item_service),
    _user: dict = Depends(get_current_user),
) -> List[Item]:
    return service.list_items()


@router.get("/{item_id}", response_model=Item)
def get_item(
    item_id: str,
    service: ItemService = Depends(get_item_service),
    _user: dict = Depends(get_current_user),
) -> Item:
    item = service.get_item(item_id)
    if item is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found")
    return item


@router.post("", response_model=Item, status_code=status.HTTP_201_CREATED)
def create_item(
    data: ItemCreate,
    service: ItemService = Depends(get_item_service),
    _user: dict = Depends(get_current_user),
) -> Item:
    return service.create_item(data)


@router.patch("/{item_id}", response_model=Item)
def update_item(
    item_id: str,
    data: ItemUpdate,
    service: ItemService = Depends(get_item_service),
    _user: dict = Depends(get_current_user),
) -> Item:
    item = service.update_item(item_id, data)
    if item is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found")
    return item


@router.delete("/{item_id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_item(
    item_id: str,
    service: ItemService = Depends(get_item_service),
    _user: dict = Depends(get_current_user),
) -> None:
    deleted = service.delete_item(item_id)
    if not deleted:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Item not found")
