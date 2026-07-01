from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    project_id: str
    subscription_name: str
    dataset_id: str
    table_id: str

    class Config:
        env_file = ".env"


settings = Settings()