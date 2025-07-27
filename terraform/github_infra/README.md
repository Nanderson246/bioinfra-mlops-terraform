---

### 📦 `terraform/github_infra/README.md`

## 📍 Purpose

This folder contains Terraform configuration to manage your **GitHub organization or personal repositories** as infrastructure.

> ✅ Automate your GitHub setup: repos, teams, collaborators, secrets, branch rules — all version-controlled and reproducible.

---

## 📦 What It Manages

* Creation of one or more repositories (public or private)
* Repository descriptions, visibility, topics
* Teams and team access (if using GitHub orgs)
* Adding collaborators with read/write/admin access
* Adding secrets to repos for use with GitHub Actions

---

## 📁 Files

* `main.tf` – Defines GitHub repos, permissions, and optional teams
* `variables.tf` – Inputs like repo names, visibility, collaborators
* `outputs.tf` – Useful repo URLs or IDs

---

## 🚀 Usage

### 1. Generate a GitHub Token

Create a **Personal Access Token (classic)** with scopes:

* `repo`
* `admin:org` (if working with orgs)
* `workflow` (if using Actions)

Save it securely.

### 2. Export the token to your shell

```bash
export GITHUB_TOKEN="your-token-here"
export GITHUB_OWNER="your-username-or-org"
```

### 3. Initialize and apply Terraform

```bash
cd terraform/github_infra
terraform init
terraform apply
```

---

## 🔐 Requirements

* Terraform CLI
* A valid GitHub account
* A GitHub token with proper scopes
* (Optional) An organization if using teams

---

## 🧠 Why Use This?

* **Reproducibility**: Your GitHub infra is versioned just like your code
* **Speed**: Spin up a new project with repo, issues, secrets in seconds
* **Professionalism**: Manage collaboration access cleanly and securely
* **Automation**: Combine with CI/CD or Actions secrets management

---
✅ Example output when you run terraform apply:
Outputs:

repository_name = "bioinfra-mlops"
repository_clone_url = "https://github.com/your-username/bioinfra-mlops.git"
repository_web_url = "https://github.com/your-username/bioinfra-mlops"


