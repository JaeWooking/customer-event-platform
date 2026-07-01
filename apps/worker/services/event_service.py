from schemas.event import CustomerEvent
from services.bigquery import insert_event


def process_event(event: CustomerEvent):

    insert_event(event)