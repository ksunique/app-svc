# app-svc
Tiny FastAPI service for the FinCore demo.

## Run locally
```bash
python -m uvicorn src.main:app --reload --port 8080
curl localhost:8080/healthz
```

## Build & Deploy (Helm)
- Push to `main` → GitHub Actions builds image (GHCR) and `helm upgrade --install` to the `dev` namespace.

## Secrets
- If Crossplane/ESO provisions DB creds, create `Secret app-db` with key `url`, or let ESO manage it.
