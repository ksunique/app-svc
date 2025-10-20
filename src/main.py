from fastapi import FastAPI
from fastapi.responses import PlainTextResponse
import os

app = FastAPI(title="FinCore App Service", version="0.1.0")

@app.get("/healthz", response_class=PlainTextResponse)
def healthz():
    return "ok - this seems working"

@app.get("/", response_class=PlainTextResponse)
def root():
    return "Hello from FinCore"

@app.get("/config", response_class=PlainTextResponse)
def config():
    db_url = os.getenv("DB_URL", "not-set")
    return f"DB_URL={db_url}"
