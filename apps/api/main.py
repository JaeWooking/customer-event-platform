from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {
        "message": "Customer Event Platform"
    }


@app.get("/health")
def health():
    return {
        "status": "ok"
    }