## 📦 terraform/kubernetes/eks_cluster/README.md

📍 Purpose
This folder defines a Kubernetes cluster on AWS using EKS (Elastic Kubernetes Service).

✅ EKS = Amazon's managed Kubernetes service
It handles the control plane, scaling, security, and upgrades, letting you focus on deploying workloads.

📦 What It Does
This Terraform module provisions:

An EKS cluster in your selected AWS region

A set of worker nodes (EC2 instances or Fargate)

IAM roles and security groups

Outputs a kubeconfig to access the cluster via kubectl

📁 Files
main.tf – EKS cluster and node group config

variables.tf – Inputs like region, cluster name, node instance type

outputs.tf – Cluster name, endpoint, and kubeconfig

🚀 Usage
1. Set AWS credentials in your terminal:
bash
Copy
Edit
export AWS_ACCESS_KEY_ID="YOUR_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET"
export AWS_REGION="us-west-2"
2. Initialize and apply Terraform:
bash
Copy
Edit
cd terraform/kubernetes/eks_cluster
terraform init
terraform apply
3. Configure your Kubernetes CLI:
bash
Copy
Edit
aws eks update-kubeconfig --name <cluster_name> --region <region>
kubectl get nodes
🔐 Requirements
AWS account and permissions for EKS + EC2 + IAM

Terraform CLI

AWS CLI installed and configured

kubectl (Kubernetes command-line tool)

🧠 Why Use EKS?
Benefit	Description
Managed control plane	No need to run Kubernetes master nodes
Easy scaling	Add/remove EC2 worker nodes dynamically
AWS-native integrations	Use IAM, CloudWatch, EFS, ALB, etc.
Ideal for containerized tools	Run ML models, APIs, pipelines, JupyterHub


---

### 🧭 Option 1: Terraform doesn't natively run `kubectl`

Terraform creates your EKS cluster, but it doesn’t auto-configure your local machine to talk to it. For that, you'd usually run this **manually** after apply:

```bash
aws eks --region us-west-2 update-kubeconfig --name bioinfra-eks-cluster
```

---

### 🧰 Option 2: Add a `configure_kubectl.sh` helper script (recommended)

You can drop this script in your `eks_cluster/` folder:

```bash
#!/bin/bash
# configure_kubectl.sh

REGION="us-west-2"
CLUSTER_NAME="bioinfra-eks-cluster"

echo "📡 Updating kubeconfig for EKS cluster: $CLUSTER_NAME"
aws eks --region "$REGION" update-kubeconfig --name "$CLUSTER_NAME"
```

Then run:

```bash
chmod +x configure_kubectl.sh
./configure_kubectl.sh
```

---

### ⚙️ Option 3 (advanced): Use Terraform `null_resource` to run it post-apply

You can automate `aws eks update-kubeconfig` from within `main.tf`, but it’s not always recommended because:

* Terraform isn’t meant to configure local CLI state
* You might apply from a CI/CD server, not a dev machine

---


