# 🤖 2. ML Model Training Script (ml_model/train.py)

import pandas as pd
import numpy as np
from sklearn.datasets import load_breast_cancer
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix
import mlflow
import mlflow.sklearn
import joblib
import seaborn as sns
import matplotlib.pyplot as plt

# 📦 Load real dataset
data = load_breast_cancer()
X = pd.DataFrame(data.data, columns=data.feature_names)
y = pd.Series(data.target)

# 🔀 Split
X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=42, stratify=y)

# ✅ Enable autologging
mlflow.set_experiment("BioinfraML")
mlflow.sklearn.autolog()

with mlflow.start_run():
    model = RandomForestClassifier(n_estimators=100, max_depth=5, random_state=42)
    model.fit(X_train, y_train)

    preds = model.predict(X_test)
    acc = accuracy_score(y_test, preds)
    cm = confusion_matrix(y_test, preds)

    mlflow.log_metric("accuracy", acc)

    # 🔐 Save model locally
    joblib.dump(model, "model.pkl")

    # 📊 Save confusion matrix
    plt.figure(figsize=(6, 4))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues", xticklabels=data.target_names, yticklabels=data.target_names)
    plt.title("Confusion Matrix")
    plt.xlabel("Predicted")
    plt.ylabel("Actual")
    plt.tight_layout()
    plt.savefig("confusion_matrix.png")
    mlflow.log_artifact("confusion_matrix.png")

    print(f"✅ Accuracy: {acc}")
    print("📦 Model saved as model.pkl and logged to MLflow.")
