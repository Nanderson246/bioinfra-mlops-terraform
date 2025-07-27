### 📦 `terraform/kubernetes/kind_local/README.md`

This setup is for running Kubernetes locally using KinD (Kubernetes in Docker) — no cloud needed.

This is not Terraform-managed in the traditional sense, since KinD runs on your machine via Docker. 
To keep the structure consistent, you need to create Terraform-like placeholders and a helper script to spin up the cluster.

---

### 🧠 What is `kind_local`?

> ✅ **kind** = **K**ubernetes **IN** **D**ocker
> It’s a lightweight tool that lets you **run a full Kubernetes cluster locally**, using Docker containers as the nodes.

So `kind_local` means you're:

* Running Kubernetes **on your own machine**
* **Not using cloud resources**
* Perfect for testing, dev work, and learning — no cost, no wait

---


## 📍 Purpose

This folder provides configuration to spin up a **local Kubernetes cluster using `kind` (Kubernetes in Docker)**.

> It’s ideal for:
>
> * Local dev/testing before deploying to AWS/GCP
> * Learning Kubernetes without using the cloud
> * Running lightweight pipelines or ML workloads on your laptop

---

## 📦 What It Does

This module sets up:

* A 1-node or multi-node Kubernetes cluster **inside Docker containers**
* Optional volume mounts or ingress setup
* Kubeconfig output so you can use `kubectl` right away

---

## 📁 Files

* `main.tf` – Shell provisioner or `null_resource` to run `kind create cluster`
* `variables.tf` – Cluster name, number of nodes
* `outputs.tf` – Path to local `kubeconfig`

---

## 🚀 Usage

### 1. Install prerequisites

```bash
# Install Docker (if not already installed)
sudo apt install docker.io

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/

# (Optional) Install kubectl
sudo apt install kubectl
```

### 2. Create the cluster

You can do this manually or use Terraform with `null_resource`:

```bash
cd terraform/kubernetes/kind_local
terraform init
terraform apply
```

Or run `kind` directly:

```bash
kind create cluster --name bio-cluster
kubectl get nodes
```

---

## 🔐 Requirements

* Docker installed and running
* `kind` CLI installed
* (Optional) `kubectl` for cluster access
* Terraform if automating the setup

---

## 🧠 Why Use kind?

| Benefit                  | Description                                |
| ------------------------ | ------------------------------------------ |
| Runs locally             | Zero cloud cost or credentials needed      |
| Fast spin-up             | Cluster ready in seconds                   |
| Great for dev/testing    | Try deployments or Helm charts safely      |
| Consistent with real K8s | Uses the same Kubernetes code as cloud K8s |

---

This setup is for running **Kubernetes locally using KinD** (Kubernetes in Docker) — no cloud needed.

This is **not Terraform-managed** in the traditional sense, since KinD runs on your machine via Docker. But to keep the structure consistent, we’ll create Terraform-like placeholders and a **helper script** to spin up the cluster.

---

### 📁 `terraform/kind_local/` folder:

```
kind_local/
├── main.tf          ✅ (just for reference)
├── variables.tf     ✅ (optional: Docker image version)
├── outputs.tf       ✅ (optional: kubeconfig info)
├── kind_cluster.yaml  ✅ (actual cluster config)
├── create_kind_cluster.sh ✅ (helper script)
```

---

### 📄 `main.tf`

*Kind doesn't use Terraform*, but we create this placeholder for structure:

```hcl
# Note: KinD is not provisioned via Terraform.
# Use the shell script and kind YAML to deploy the cluster locally.
```

---

### 📄 `variables.tf`

(Optional, just for tracking the image version):

```hcl
variable "kind_k8s_image" {
  description = "KinD Kubernetes node image"
  default     = "kindest/node:v1.29.2"
}
```

---

### 📄 `outputs.tf`

This is just documentation — no outputs are generated via Terraform:

```hcl
# No outputs — KinD is managed locally via Docker
```

---

### 📄 `kind_cluster.yaml`

```yaml
# kind_cluster.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: bioinfra-kind
nodes:
  - role: control-plane
  - role: worker
  - role: worker
```

You can add port mappings, extra mounts, etc., if needed later.

---

### 📄 `create_kind_cluster.sh`

```bash
#!/bin/bash
# Create KinD Cluster locally

CLUSTER_NAME="bioinfra-kind"
K8S_IMAGE="kindest/node:v1.29.2"

echo "🚀 Creating local KinD cluster: $CLUSTER_NAME"
kind create cluster --name "$CLUSTER_NAME" --image "$K8S_IMAGE" --config kind_cluster.yaml

echo "✅ KinD cluster created. Check with: kubectl get nodes"
```

> Make executable:

```bash
chmod +x create_kind_cluster.sh
```

---

### ✅ To Use:

```bash
cd terraform/kind_local
./create_kind_cluster.sh
kubectl get nodes
```

You’ll see a 3-node cluster running locally in Docker. No cloud creds needed.

---

You can also add:

* Ingress support
* Local Docker registry
* Volumes for testing real bio/ML workloads



