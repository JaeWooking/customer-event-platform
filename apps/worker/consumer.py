import json

from google.cloud import pubsub_v1

from config import settings
from schemas.event import CustomerEvent
from services.event_service import process_event

subscriber = pubsub_v1.SubscriberClient()

subscription_path = subscriber.subscription_path(
    settings.project_id,
    settings.subscription_name,
)


def callback(message):

    try:
        payload = json.loads(message.data.decode())

        event = CustomerEvent(**payload)

        process_event(event)

        message.ack()

        print(f"Processed: {event.event_id}")

    except Exception as e:
        print(e)

        message.nack()


def start_consumer():

    streaming_pull_future = subscriber.subscribe(
        subscription_path,
        callback=callback,
    )

    print("Worker Started")

    streaming_pull_future.result()