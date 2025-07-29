# Use official Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy app files
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port Flask runs on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
