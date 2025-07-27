
### 📦 `terraform/kubernetes/gke_cluster/README.md`

## 📍 Purpose

This folder provisions a **Kubernetes cluster on Google Cloud using GKE (Google Kubernetes Engine)**.

> ✅ **GKE** = Google Cloud’s fully managed Kubernetes service
> Ideal for scalable, containerized workloads such as ML pipelines, APIs, or scientific data processing.

---

## 📦 What It Does

This Terraform module sets up:

* A GKE cluster in your selected GCP region/zone
* Node pools (VMs to run your workloads)
* Networking, IAM roles, and basic permissions
* Outputs a `kubeconfig` file to access the cluster with `kubectl`

---

## 📁 Files

* `main.tf` – GKE cluster, node pool, and network setup
* `variables.tf` – Project ID, region, cluster name, node size, etc.
* `outputs.tf` – Cluster endpoint and authentication config

---

## 🚀 Usage

### 1. Authenticate to your GCP project:

```bash
gcloud auth login
gcloud config set project <your-gcp-project-id>
```

Make sure you have enabled the Kubernetes Engine API:

```bash
gcloud services enable container.googleapis.com
```

### 2. Run Terraform:

```bash
cd terraform/kubernetes/gke_cluster
terraform init
terraform apply
```

### 3. Configure `kubectl`:

```bash
gcloud container clusters get-credentials <cluster-name> \
  --zone <zone> \
  --project <your-gcp-project-id>

kubectl get nodes
```

---

## 🔐 Requirements

* A GCP project with billing enabled
* IAM permissions for Kubernetes Engine, Compute Engine, IAM
* Terraform CLI
* Google Cloud SDK (`gcloud`)
* `kubectl`

---

## 🧠 Why Use GKE?

| Benefit                        | Description                                      |
| ------------------------------ | ------------------------------------------------ |
| Fully managed control plane    | No need to patch or upgrade Kubernetes yourself  |
| Autoscaling and node pools     | Efficient use of cloud resources                 |
| Tight GCP integration          | Use with BigQuery, Vertex AI, Cloud Storage      |
| Ideal for scientific workloads | Supports MLflow, Nextflow, APIs, custom services |

---

✅ Notes
You must have enabled GKE API in your GCP project.

You also need a VPC + subnetwork, or I can help you add a module for those too.

After applying, authenticate with:

bash
Copy
Edit
gcloud container clusters get-credentials bioinfra-gke-cluster --region us-central1 --project <your-project-id>

Here’s a matching helper script for **GKE** to configure `kubectl` access after deploying your cluster.

---

### 📄 `configure_kubectl.sh` for `gke_cluster/`

Create this file inside your `terraform/gke_cluster/` folder:

```bash
#!/bin/bash
# configure_kubectl.sh — for GKE

PROJECT_ID="your-project-id"
REGION="us-central1"
CLUSTER_NAME="bioinfra-gke-cluster"

echo "📡 Updating kubeconfig for GKE cluster: $CLUSTER_NAME"
gcloud container clusters get-credentials "$CLUSTER_NAME" \
  --region "$REGION" \
  --project "$PROJECT_ID"
```

---

### 🛠️ Usage

1. Replace `"your-project-id"` with your actual GCP project ID.
2. Make it executable:

   ```bash
   chmod +x configure_kubectl.sh
   ```
3. Run it:

   ```bash
   ./configure_kubectl.sh
   ```

---

### ✅ Result

After running this, your `kubectl` config will be updated, and you’ll be able to do:

```bash
kubectl get nodes
kubectl get pods
```


