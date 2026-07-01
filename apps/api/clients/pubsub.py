import json

from google.cloud import pubsub_v1

from app.config import settings

publisher = pubsub_v1.PublisherClient()

topic_path = publisher.topic_path(
    settings.project_id,
    settings.topic_name,
)


def publish(message: dict) -> str:
    future = publisher.publish(
        topic_path,
        json.dumps(message).encode("utf-8"),
    )

    return future.result()