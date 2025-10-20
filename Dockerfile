# Build stage
FROM python:3.12-slim AS builder
WORKDIR /app
RUN pip install --no-cache-dir fastapi uvicorn

# Runtime
FROM gcr.io/distroless/python3-debian12:nonroot
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
COPY --from=builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY src/ /app/
EXPOSE 8080
CMD ["-m","uvicorn","main:app","--host","0.0.0.0","--port","8080"]
