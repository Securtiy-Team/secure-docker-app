FROM python:3.11-slim
WORKDIR /app

# Upgrade pip and setuptools first
RUN pip install --no-cache-dir --upgrade pip setuptools

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
CMD ["python", "app.py"]
