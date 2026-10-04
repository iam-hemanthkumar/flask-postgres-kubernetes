# BUILD STAGE

FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN python -m venv .venv && \
	.venv/bin/pip install --no-cache-dir -r requirements.txt


# PRODUCTION STAGE

FROM python:3.12-slim

WORKDIR /app

RUN useradd -m appuser

COPY --from=builder /app/.venv /app/.venv

COPY . .

USER appuser

EXPOSE 5000

CMD [ "/app/.venv/bin/python3", "app.py" ]
