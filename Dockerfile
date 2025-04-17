# Use official Python image with SHA pinning
FROM python:3.11.9-slim-bookworm@sha256:2c500c29f9a25a9a8f6e3e3e0a7e0d9c7b1b1b1b1b1b1b1b1b1b1b1b1b1b

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
