from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    project_id: str
    topic_name: str

    class Config:
        env_file = ".env"


settings = Settings()