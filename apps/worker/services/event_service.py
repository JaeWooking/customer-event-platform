from schemas.event import CustomerEvent
from services.bigquery import insert_event


def process_event(event: CustomerEvent):
    # 앞으로 Validation
    # 앞으로 Enrichment

    insert_event(event)
