from fastapi import FastAPI

from app.routers.events import router as event_router

app = FastAPI(
    title="Customer Event API",
)

app.include_router(event_router)


@app.get("/health")
def health():
    return {"status": "ok"}