from datetime import datetime
from typing import Any

from pydantic import BaseModel, Field


class CustomerEventRequest(BaseModel):
    event_name: str
    user_id: str
    session_id: str | None = None
    properties: dict[str, Any] = Field(default_factory=dict)


class CustomerEvent(BaseModel):
    event_id: str
    event_time: datetime

    event_name: str
    user_id: str
    session_id: str | None = None

    properties: dict[str, Any]