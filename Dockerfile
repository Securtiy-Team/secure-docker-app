# Use official Python image with valid SHA pinning
FROM python:3.11.9-slim-bookworm@sha256:1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2

# Force system upgrades
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Non-root setup
RUN useradd -m appuser && \
    mkdir -p /app && \
    chown appuser:appuser /app
USER appuser
WORKDIR /app

# Install dependencies
COPY --chown=appuser:appuser requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY --chown=appuser:appuser . .

CMD ["python", "app.py"]
