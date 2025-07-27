## 📦 terraform/kubernetes_cluster/README.md

📍 Purpose
This folder contains a Terraform module to deploy a Kubernetes cluster for running containerized workloads.

✅ Kubernetes (K8s) = An open-source system for automating deployment, scaling, and management of containers.

It’s ideal for:

Running bioinformatics pipelines in containers (e.g. with Nextflow or Argo)

Deploying machine learning models or APIs

Managing reproducible scientific services (e.g., JupyterHub, MLflow, Galaxy)

📦 What It Does
This module can provision:

A managed K8s cluster in the cloud (e.g. EKS on AWS, GKE on GCP, or AKS on Azure)

Or a local development cluster using kind (Kubernetes in Docker)

It sets up:

Control plane + worker nodes

Networking and security

(Optional) namespaces or Helm deployments

📁 Files
main.tf – Defines the cluster and provider-specific config

variables.tf – Inputs like region, cluster name, node type

outputs.tf – Cluster endpoint, kubeconfig, etc.

🚀 Usage
1. Choose a backend (e.g., AWS EKS)
bash
Copy
Edit
cd terraform/kubernetes_cluster
terraform init
terraform apply
Terraform will provision the cluster and output your kubeconfig.

2. Configure kubectl
bash
Copy
Edit
export KUBECONFIG=./kubeconfig_eks.yaml
kubectl get nodes
3. Deploy workloads (e.g., ML models, services)
bash
Copy
Edit
kubectl apply -f deployment.yaml
🔐 Requirements
Terraform CLI

Cloud provider credentials (AWS/GCP/Azure) or Docker for local

kubectl installed

(Optional) helm for charts

🧠 Why Use Kubernetes for Bioinformatics?
Use Case	Benefit
Run Nextflow pipelines	Native Kubernetes backend supported
Host JupyterHub or ML APIs	Scalable, container-native deployment
Reproducible compute stacks	Defined as YAML, portable across systems
Batch analysis	Use jobs + autoscaling nodes

Absolutely — here's a clear and complete **step-by-step overview** of how to go from your **Terraform deployment** to a **working Kubernetes setup**. Then I’ll show you how to add this to your general `README.md` for the `kubernetes/` folder.

---

## 🧭 Steps: From Terraform to Kubernetes Access (EKS & GKE)

### ✅ 1. **Deploy your infrastructure with Terraform**

For either EKS (AWS) or GKE (GCP), go into the appropriate folder and run:

```bash
terraform init
terraform apply
```

This provisions:

* Your Kubernetes cluster (EKS or GKE)
* Optional VPC, subnets, IAM roles, etc.

---

### ✅ 2. **Configure `kubectl` to talk to your cluster**

Use the platform-specific helper script we created:

#### For AWS EKS:

```bash
cd terraform/eks_cluster
./configure_kubectl.sh
```

This runs:

```bash
aws eks --region <your-region> update-kubeconfig --name <cluster-name>
```

#### For GCP GKE:

```bash
cd terraform/gke_cluster
./configure_kubectl.sh
```

This runs:

```bash
gcloud container clusters get-credentials <cluster-name> \
  --region <region> --project <project-id>
```

---

### ✅ 3. **Verify `kubectl` connection**

Run:

```bash
kubectl get nodes
```

You should see the nodes in your Kubernetes cluster. That means everything is working.

---

### ✅ 4. **(Optional) Deploy an app or service**

If you want to deploy an app (like MLflow, Jupyter, or a FastAPI app), you’ll use a Kubernetes YAML file (or Helm) and run:

```bash
kubectl apply -f my-app-deployment.yaml
```

---

## 📝 How to Add This to the General Kubernetes `README.md`

Here’s a suggested section to include under `kubernetes/README.md`:

---

````md
# ☸️ Kubernetes Cluster Overview

This directory contains Terraform configurations for deploying Kubernetes clusters on different platforms:

- `eks_cluster/` → AWS Elastic Kubernetes Service (EKS)
- `gke_cluster/` → Google Kubernetes Engine (GKE)
- `kind_local/` → Local Kubernetes using KinD (for testing)

---

## 🛠 How to Use

### Step 1: Deploy with Terraform

Go to your provider-specific folder and run:

```bash
terraform init
terraform apply
````

---

### Step 2: Configure `kubectl` Access

After deployment, configure `kubectl` to connect to the new cluster.

#### For AWS (EKS)

```bash
cd eks_cluster
./configure_kubectl.sh
```

#### For GCP (GKE)

```bash
cd gke_cluster
./configure_kubectl.sh
```

---

### Step 3: Test the Connection

Run:

```bash
kubectl get nodes
```

You should see the cluster nodes listed. You're ready to deploy workloads!

---

### Optional: Deploy an App

If you have a Kubernetes manifest file (e.g. `mlflow.yaml` or `jupyter.yaml`), you can deploy it using:

```bash
kubectl apply -f your-deployment.yaml
```

---

## 🔖 Notes

* EKS uses IAM roles, so make sure your AWS credentials are configured.
* GKE requires `gcloud` CLI and project-level permissions.
* For local testing, you can use `kind_local/` with KinD.

```
---



