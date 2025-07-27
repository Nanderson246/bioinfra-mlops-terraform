
# ✅ Project: MLOps + Bioinformatics on AWS with Terraform

## 📁 Directory Structure

```
bioinfra-mlops-terraform/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── ml_model/
│   ├── train.py
│   ├── model.pkl
│   ├── requirements.txt
│   ├── mlflow_tracking.py
│   └── docs/
├── docker/
│   ├── Dockerfile
│   └── app.py
├── README.md
```

---

## 📦 1. Terraform Configuration (`terraform/`)

### `main.tf`

```hcl
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mlops_instance" {
  ami           = var.ami_id
  instance_type = "t2.medium"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y python3-pip docker.io git
              pip3 install mlflow scikit-learn pandas boto3
              EOF

  tags = {
    Name = "MLOpsBioinfraInstance"
  }
}
```

### `variables.tf`

```hcl
variable "aws_region" {
  default = "us-west-2"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04
}

variable "key_name" {
  default = "your-key-name"
}
```

### `outputs.tf`

```hcl
output "instance_ip" {
  value = aws_instance.mlops_instance.public_ip
}
```

---

## 🤖 2. ML Model Training (`ml_model/train.py`)

This script loads the **breast cancer dataset** from scikit-learn, trains a **RandomForestClassifier**, tracks the experiment using **MLflow**, and saves the model with `joblib`.

```python
from sklearn.datasets import load_breast_cancer
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import mlflow
import mlflow.sklearn
import pandas as pd
import joblib

# Load dataset
data = load_breast_cancer()
X = pd.DataFrame(data.data, columns=data.feature_names)
y = pd.Series(data.target)

# Train/test split
X_train, X_test, y_train, y_test = train_test_split(X, y)

# Train model
model = RandomForestClassifier(max_depth=5, random_state=42)
model.fit(X_train, y_train)

# Evaluate
acc = accuracy_score(y_test, model.predict(X_test))

# Log to MLflow
mlflow.set_experiment("BioinfraML")
with mlflow.start_run():
    mlflow.log_metric("accuracy", acc)
    mlflow.sklearn.log_model(
        sk_model=model,
        artifact_path="mlflow_model",
        input_example=X_test.iloc[0:1]
    )

# Save locally
joblib.dump(model, "model.pkl")

print(f"✅ Accuracy: {acc}")
print("📦 Model saved as model.pkl and logged to MLflow.")
```

---

## 🐳 3. Docker Deployment (`docker/`)

### `Dockerfile`

```Dockerfile
FROM python:3.9
WORKDIR /app
COPY ../ml_model/ .
RUN pip install -r requirements.txt
CMD ["python", "train.py"]
```

### `app.py`

A simple Flask API that loads the trained model and predicts a class given two features:

```python
from flask import Flask, request, jsonify
import joblib
import numpy as np

app = Flask(__name__)
model = joblib.load("model.pkl")

@app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json()
    features = np.array([data['mean radius'], data['mean texture']]).reshape(1, -1)
    prediction = model.predict(features)[0]
    return jsonify({"prediction": int(prediction)})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

---

## 📘 4. Deployment Instructions

### 🛠️ Setup

1. Install [Terraform](https://developer.hashicorp.com/terraform/install) and [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
2. Configure AWS credentials:
   `aws configure`

---

### 🚀 Deploy Infrastructure

```bash
cd terraform
terraform init
terraform apply
```

---

### 🖥️ SSH into the Instance

```bash
ssh -i your-key.pem ubuntu@<instance_ip>
```

---

### 📦 Run ML Pipeline

```bash
cd ml_model
python3 train.py
```

---

### 🐳 Optionally Run Docker App

```bash
docker build -t mlapp ../docker
docker run -p 5000:5000 mlapp
```

---

## ✅ You’re Now Ready To:

* Build infrastructure with Terraform
* Train & track machine learning models
* Deploy them via Docker
* Extend it to multi-cloud (GCP, Azure), Kubernetes, GitHub Actions

---

