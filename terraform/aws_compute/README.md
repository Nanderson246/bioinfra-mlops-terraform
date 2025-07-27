# 📦 terraform/aws_compute/README.md

## 📍 Purpose
This folder contains Terraform configuration to deploy a virtual machine (EC2 instance) in **Amazon Web Services (AWS)**. It is intended for running MLOps workflows and bioinformatics pipelines in the cloud.

---

## 📦 What It Deploys
- A **t2.medium** EC2 instance
- An Ubuntu 20.04 Linux server
- Installs basic tools via `user_data`: Python, pip, Docker, MLflow, scikit-learn
- Outputs the public IP address for SSH access

---

## 📁 Files
- `main.tf` – Defines the AWS EC2 resource and installation script
- `variables.tf` – Contains configurable inputs like region, keypair, AMI
- `outputs.tf` – Returns the instance IP

---

## 🚀 Usage
1. Set your AWS credentials in the terminal:
```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
```
Or run the guided setup:
```bash
aws configure
```
You will be prompted to enter:
- AWS Access Key ID
- AWS Secret Access Key
- Default region (e.g. us-west-2)
- Output format (e.g. json)

2. Make sure your keypair name matches the one in `terraform.tfvars` or `variables.tf`
3. Run:
```bash
cd terraform/aws_compute
terraform init
terraform apply
```
4. After apply completes, SSH into the instance:
```bash
ssh -i your-key.pem ubuntu@<instance_ip>
```

```

---

## 🔐 Requirements
- An AWS account
- A keypair created in the AWS EC2 dashboard
- Terraform CLI installed

---

## 🧠 Why AWS?
- AWS is a widely used cloud platform with flexible compute options
- Good for prototyping, pipelines, and scalable compute
- Terraform makes infrastructure reproducible and automatable

---

This AWS module is a foundational component of the larger MLOps bioinformatics pipeline.
