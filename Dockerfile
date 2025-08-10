FROM python:3.9-slim-bookworm

# Install system dependencies
RUN apt-get update &&     apt-get install -y --no-install-recommends         wget         gcc         g++         libffi-dev         libssl-dev         libcurl4-openssl-dev         musl-tools         ffmpeg         aria2         python3-pip     && apt-get clean     && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip &&     pip install --no-cache-dir -r requirements.txt &&     pip install --no-cache-dir -U yt-dlp

# Copy the rest of the application code
COPY . /app/

# Start both web and bot
CMD gunicorn app:app & python3 main.py



