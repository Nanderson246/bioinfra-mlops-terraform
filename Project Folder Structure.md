# 🗂️ Project Folder Structure Overview

This document explains the purpose and contents of each directory and file in the **Bioinfra MLOps Terraform Project**.

---

## 📁 Root Directory

| Name                        | Description |
|-----------------------------|-------------|
| `README.md`                | Project overview, setup, and usage instructions. |
| `FOLDER_STRUCTURE.md`      | (This file) Explains the structure and purpose of the project files. |
| `What_is_Terraform_open_source.md` | Notes on Terraform's licensing and open-source model. |

---

Perfect addition — your note clarifies the dynamic behavior of the `ml_model/` folder and guides the user on what to expect post-training. Here's the revised section with your note smoothly integrated:

---

## 📁 `ml_model/`

Contains the core machine learning logic and experiment tracking setup.

| File / Folder        | Purpose                                                                                 |
| -------------------- | --------------------------------------------------------------------------------------- |
| `train.py`           | Trains a `RandomForestClassifier` on the breast cancer dataset and logs it to MLflow.   |
| `mlflow_tracking.py` | Helper module for decoupled MLflow logging logic (optional use).                        |
| `model.pkl`          | Serialized trained model (created after training) using `joblib`. Used by the REST API. |
| `requirements.txt`   | Python dependencies for training and tracking.                                          |
| `run_train.sh`       | Shell script to trigger training (helpful on cloud VMs).                                |
| `debug_model.py`     | Python script to validate model and verified desrialization.                            |
| `docs/`              | Supplementary documentation related to ML behavior and Docker use.                      |

> **Note:** After running `train.py`, the following files/directories will be generated:
>
> * `model.pkl`: saved trained model
> * `mlruns/`: MLflow experiment tracking folder
> * `confusion_matrix.png`: graphical artifact logged during training

---

Would you like me to regenerate the entire `FOLDER_STRUCTURE.md` file with this update included?

### 📁 `ml_model/docs/`

| File                              | Description |
|----------------------------------|-------------|
| `dockerbuild_and test_API.md`    | How to build and test the Docker API for model prediction. |
| `What is model pkl.md`           | Explanation of the `.pkl` model file format and use case. |

---

## 📁 `docker/`

Houses the Dockerized version of the ML pipeline.

| File           | Purpose |
|----------------|---------|
| `Dockerfile`   | Defines the Docker image for training or serving the model. |
| `app.py`       | Simple Flask API to load `model.pkl` and serve predictions via HTTP. |

---

## 📁 `terraform/`

Main infrastructure-as-code (IaC) directory. Each subfolder represents a platform or environment.

| Subfolder             | Purpose |
|------------------------|---------|
| `aws_compute/`         | Terraform configuration for AWS EC2 deployment. |
| `azure_ml/`            | Terraform configuration for Azure ML / VMs. |
| `docker_local/`        | Local Docker environment for testing. |
| `gcp_pipeline/`_

