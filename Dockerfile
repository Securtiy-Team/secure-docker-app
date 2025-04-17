# Use minimal Python image with explicit version pinning
FROM python:3.11.9-slim-bookworm@sha256:2c500c29f9a25a9a8f6e3e3e0a7e0d9c7b1b1b1b1b1b1b1b1b1b1b1b1b1b1b

# Force upgrade all system packages
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

# Install Python dependencies
COPY --chown=appuser:appuser requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY --chown=appuser:appuser . .

# Runtime
CMD ["python", "app.py"]
