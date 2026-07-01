from datetime import datetime
from typing import Any

from pydantic import BaseModel


class CustomerEvent(BaseModel):
    event_id: str
    event_time: datetime

    event_name: str
    user_id: str
    session_id: str | None = None

    properties: dict[str, Any]