---

# 📦 terraform/azure_ml/README.md

## 📍 Purpose
This folder contains Terraform configuration to deploy a virtual machine in **Microsoft Azure**, designed to support MLOps workflows and bioinformatics pipelines.

---

## 📦 What It Deploys
- A Linux virtual machine on Azure
- A resource group to organize infrastructure
- Basic installation script for tools (e.g., Python, pip, ML packages)
- Outputs the public IP address for SSH access

---

## 📁 Files
- `main.tf` – Azure resource definitions for VM and networking
- `variables.tf` – Defines configurable options like location, VM size, admin username
- `outputs.tf` – Returns public IP address

---

## 🚀 Usage
1. Ensure the Azure CLI is installed and authenticated:
```bash
az login
```
You’ll be redirected to sign in with your Microsoft account in the browser.

2. Set your active subscription (if you have more than one):
```bash
az account set --subscription "your-subscription-name"
```

3. Initialize and apply Terraform:
```bash
cd terraform/azure_ml
terraform init
terraform apply
```

4. After apply completes, SSH into your VM:
```bash
ssh <admin-username>@<public-ip>
```

---

## 🔐 Requirements
- An Azure account and active subscription
- Azure CLI installed and authenticated
- SSH keypair (or use password authentication if configured)
- Terraform CLI installed

---

## 🧠 Why Azure?
- Azure is used in many academic, enterprise, and healthcare environments
- Good integration with Microsoft tools and services
- Azure supports scalable compute and AI/ML workloads

---

This Azure module demonstrates how to provision a cloud environment for data science and MLOps workflows in a reproducible way using Terraform.

Great question — here's what that sentence means in practical terms:

---

## 🧩 Option 1: **Install ML libraries on your VM manually**

If you're creating just a **virtual machine (VM)** on Azure using Terraform — like we did above — then **nothing comes pre-installed**.

You'd have to:

* SSH into the machine
* Run `sudo apt install`, `pip install`, etc.
* Set up Python, Conda, MLflow, scikit-learn, etc.

🟡 This gives you flexibility, but it's manual unless you automate it.

---

## ⚙️ Option 2: **Use `custom_data` to install ML tools automatically**

Terraform supports a field in the VM definition called `custom_data` — which can run a shell script **when the VM boots**.

This lets you do things like:

```hcl
  custom_data = file("init_script.sh")
```

And your `init_script.sh` might contain:

```bash
#!/bin/bash
sudo apt update
sudo apt install -y python3-pip
pip3 install pandas scikit-learn mlflow
```

✅ This means your VM comes **preloaded** with the tools you need — no SSH or setup needed later.

Excellent — you're 100% right:

> ✅ **The `init_script.sh` is just a shell script** that contains all the installation steps you want to run automatically when the VM boots up (like `apt install`, `pip install`, `git clone`, etc.).

---

### 📌 Where does it go?

* You save the script in your project folder, e.g.:

  ```
  terraform/azure_ml/init_script.sh
  ```

* Then in your `main.tf`, inside the `azurerm_linux_virtual_machine` block, you add:

```hcl
  custom_data = file("${path.module}/init_script.sh")
```

> This tells Terraform to **embed the contents of `init_script.sh`** into the VM’s startup instructions.

---

### 📁 Folder Structure Example

```
terraform/
└── azure_ml/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── init_script.sh   ✅
```

---

### 📜 Example `init_script.sh`

```bash
#!/bin/bash
# System update
sudo apt update && sudo apt upgrade -y

# Python & ML tools
sudo apt install -y python3-pip git
pip3 install pandas scikit-learn mlflow boto3

# Optional: install Docker
sudo apt install -y docker.io
sudo usermod -aG docker $USER
```

---

### 🧠 Bonus Tip

* `custom_data` must be **base64-encoded under the hood** — Terraform does this for you automatically with the `file()` function.
* This only runs **once on the first boot**. If you destroy/recreate the VM, the script runs again.

---

Let me know if you'd like this scripted into your existing `main.tf`, or want to add things like cloning a repo or setting environment variables!

---

## ☁️ Option 3: **Use Azure Machine Learning Services (PaaS)**

Instead of raw VMs, Azure offers **managed ML platforms** like:

* `azurerm_machine_learning_workspace`
* `azurerm_machine_learning_compute_cluster`
* `azurerm_machine_learning_inference_cluster`

These are **platform-as-a-service (PaaS)** solutions, similar to SageMaker on AWS:

* You upload code or notebooks
* Azure manages compute, dependencies, tracking, model deployment

✅ This is cleaner and scalable — but less hands-on
🟡 Good if you're building production pipelines, not for low-level VM control

---

### 🧠 Summary

| Approach                      | Means                           | Best For                            |
| ----------------------------- | ------------------------------- | ----------------------------------- |
| Manual install on VM          | SSH and install yourself        | Full control, experiments           |
| `custom_data` install script  | Auto-setup at VM creation       | Faster, reproducible setup          |
| Azure ML workspace + services | Use Azure’s managed ML platform | Pipelines, model tracking, training |

---


