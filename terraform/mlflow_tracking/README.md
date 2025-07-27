### 📦 `terraform/mlflow_tracking/README.md`

## 📍 Purpose

This module provisions infrastructure to **deploy an MLflow Tracking Server**, used for logging and managing machine learning experiments.

> ✅ **MLflow Tracking** = Central service to log metrics, parameters, models, and artifacts from ML experiments.

This setup is ideal for:

* MLOps pipelines in bioinformatics
* Collaborative model training
* Reproducible science + audit trails for experiments

---

## 📦 What It Does

This Terraform module sets up:

* A **server or VM** (e.g., on AWS EC2 or GCP Compute)
* **MLflow Tracking Server** running (via systemd or Docker)
* A **backend store** (e.g., SQLite, PostgreSQL, or S3 for artifacts)
* Optional reverse proxy with Nginx

---

## 📁 Files

* `main.tf` – Infra to launch the server and run MLflow
* `variables.tf` – Inputs: region, AMI, VM size, credentials, etc.
* `outputs.tf` – Public IP / MLflow UI URL
* (Optional) `mlflow.service` or Docker config to run the app

---

## 🚀 Usage

### 1. Set up cloud credentials (AWS or GCP):

```bash
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
```

### 2. Initialize and apply Terraform:

```bash
cd terraform/mlflow_tracking
terraform init
terraform apply
```

### 3. SSH into the instance (if needed):

```bash
ssh -i your-key.pem ubuntu@<instance_ip>
```

### 4. Access MLflow UI:

```
http://<instance_ip>:5000
```

---

## 🧠 MLflow Architecture (Simple Mode)

```
ML Script (train.py) 
   ⟶ logs metrics to ⟶ MLflow Tracking Server
                            ⬑
           stores models in local dir or S3 bucket
```

---

## 🔐 Requirements

* Terraform CLI
* AWS/GCP CLI + credentials
* `mlflow` installed in training scripts
* (Optional) Docker or systemd config for service auto-start

---

## 💡 Common Use Cases

| Scenario                               | Value Added by MLflow                    |
| -------------------------------------- | ---------------------------------------- |
| Log experiment results + accuracy      | Easily compare models across runs        |
| Store models + metadata                | Reproducibility and rollback             |
| Track hyperparameters or pipeline vars | Automated ML experiments, sweep tracking |
| Expose UI to team                      | Central dashboard for training insights  |

---
📝 Notes
This setup assumes you're running MLflow as a server with:

sqlite backend (simple, local DB)

S3 for artifact storage (can be changed to local or GCS)

Works well for small setups or a portfolio project.




