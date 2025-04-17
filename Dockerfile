# Use official Python image with valid SHA pinning
FROM python:3.11.9-slim-bookworm@sha256:82c07f2f6e35255b92eb16f38dbd22679d5e8fb523064138d7c6468e7bf0c15b

# Force system upgrades and install latest setuptools first
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir --upgrade pip setuptools==70.0.0

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
