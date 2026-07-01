import json
import uuid
from datetime import UTC, datetime

from google.cloud import pubsub_v1

from config import settings
from schemas.event import CustomerEvent, CustomerEventRequest

publisher = pubsub_v1.PublisherClient()

topic_path = publisher.topic_path(
    settings.project_id,
    settings.topic_name,
)


def publish_event(request: CustomerEventRequest) -> str:
    event = CustomerEvent(
        event_id=str(uuid.uuid4()),
        event_time=datetime.now(UTC),
        event_name=request.event_name,
        user_id=request.user_id,
        session_id=request.session_id,
        properties=request.properties,
    )

    future = publisher.publish(
        topic_path,
        json.dumps(event.model_dump(mode="json")).encode("utf-8"),
    )

    return future.result()