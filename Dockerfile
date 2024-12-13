# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies (including git)
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install Python dependencies (including packages from git repositories)
RUN sed '/-e/d' requirements.txt | pip install -r /dev/stdin

# Copy the rest of the application code into the container
COPY . .

# Install any remaining dependencies from requirements.txt (if needed)
RUN pip install -r requirements.txt

# Specify the command to run on container startup
CMD ["python", "your_app.py"]  # Replace "your_app.py" with your actual script or entry point
