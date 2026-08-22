from fastapi import FastAPI

from app.api.routes import items

app = FastAPI(title="AzureFunctions API", version="0.1.0")

app.include_router(items.router)


@app.get("/health", tags=["health"])
def health_check() -> dict:
    return {"status": "ok"}
