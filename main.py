from fastapi import FastAPI

app = FastAPI(title="Pipeline Gatekeeper Target App")

@app.get("/")
def read_root():
    return {"status": "ok", "message": "Pipeline Gatekeeper target service is running"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}
