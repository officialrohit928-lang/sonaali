FROM nikolaik/python-nodejs:python3.10-nodejs18-bullseye

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    aria2 \
    git \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app
COPY . .

# Upgrade pip
RUN python -m pip install --no-cache-dir --upgrade pip

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Important for module imports
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

# Start bot directly (recommended)
CMD ["python3", "SONALI/main.py"]
