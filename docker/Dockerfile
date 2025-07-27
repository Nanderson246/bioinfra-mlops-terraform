# 🐳 3. Docker (docker/Dockerfile + app.py)

# docker/Dockerfile
FROM python:3.9

WORKDIR /app

COPY ../ml_model/ .

RUN pip install --no-cache-dir -r requirements.txt \
    && pip install flask joblib

# Option 1: Run training script
# CMD ["python", "train.py"]

# Option 2: Run REST API (if you want a serving layer)
CMD ["python", "app.py"]

