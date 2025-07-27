# 📦 terraform/docker_local/README.md

## 📍 Purpose
This folder contains a Terraform configuration that uses the **Docker provider** to run containers **locally** on your machine.

It's useful for testing your ML pipeline or setting up portable dev environments **without cloud infrastructure**.

---

## 📦 What It Deploys
- A local Docker container using the image built from your ML model code
- Container runs a basic Python app (e.g., ML training or inference API)

---

## 📁 Files
- `main.tf` – Defines a local Docker container resource

---

## 🚀 Usage
🚀 Usage
From the docker_local/ folder:

bash
Copy
Edit
terraform init
terraform apply
Make sure Docker is running locally and your ../docker/Dockerfile is valid.



1. Make sure Docker is installed and running on your system
2. Initialize Terraform and apply:
```bash
cd terraform/docker_local
terraform init
terraform apply
```
3. This will:
   - Build the Docker image
   - Start a local container
   - You can verify with:
```bash
docker ps
```

---

## 🧰 Requirements
- Docker installed locally
- Terraform CLI

---

## 🧠 Why Use This?
- Great for **offline/local dev and testing**
- Shows how Terraform can manage **non-cloud infrastructure**
- Helps prototype your ML workflows before deploying to the cloud

---

This module demonstrates how to use Terraform with Docker to manage containerized ML environments locally — perfect for quick iterations and demos.
