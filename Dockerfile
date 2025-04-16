# Use an official lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy JUST requirements first (for caching)
COPY requirements.txt .  # ← This line fails if requirements.txt doesn't exist

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app (AFTER requirements)
COPY . .  # ← This brings in app.py and other files

# Run the app
CMD ["python", "app.py"]  # ← This fails if app.py doesn't exist
