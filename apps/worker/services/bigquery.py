import json

from google.cloud import bigquery

from config import settings
from schemas.event import CustomerEvent

client = bigquery.Client()

table_id = (
    f"{settings.project_id}."
    f"{settings.dataset_id}."
    f"{settings.table_id}"
)


def insert_event(event: CustomerEvent):

    row = event.model_dump(mode="json")

    # BigQuery JSON 컬럼은 JSON 문자열로 전달
    row["properties"] = json.dumps(row["properties"])

    errors = client.insert_rows_json(
        table_id,
        [row],
    )

    if errors:
        raise RuntimeError(errors)