from fastapi import APIRouter

from app.schemas.event import CustomerEventRequest
from app.services.publisher import publish_event

router = APIRouter(
    prefix="/events",
    tags=["Events"],
)


@router.post("")
def create_event(request: CustomerEventRequest):

    message_id = publish_event(request)

    return {
        "status": "published",
        "message_id": message_id,
    }