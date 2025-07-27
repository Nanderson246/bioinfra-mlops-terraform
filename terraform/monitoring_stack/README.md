### 📦 `terraform/monitoring_stack/README.md`

## 📍 Purpose

This module provisions a **monitoring and observability stack** (typically Prometheus + Grafana) to track the health and performance of your infrastructure and ML workloads.

> ✅ Useful for spotting failures, resource limits, job issues, or service bottlenecks in real-time — across cloud, local, or HPC systems.

---

## 📦 What It Does

This Terraform module sets up:

* A **Prometheus** server for scraping metrics
* A **Grafana** instance for dashboards and visualization
* Optional exporters (Node Exporter, cAdvisor, etc.)
* Configurable data volumes or retention settings
* Can be deployed on a VM or Kubernetes cluster

---

## 📁 Files

* `main.tf` – Infra to launch monitoring VMs or Kubernetes pods
* `variables.tf` – Inputs: instance size, region, Grafana admin credentials
* `outputs.tf` – URLs and IPs for access
* (Optional) provisioning script to auto-install Prometheus & Grafana

---

## 🚀 Usage

### 1. Set cloud credentials:

```bash
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
```

### 2. Deploy with Terraform:

```bash
cd terraform/monitoring_stack
terraform init
terraform apply
```

### 3. Access services:

```bash
# Prometheus
http://<instance_ip>:9090

# Grafana (default: admin/admin)
http://<instance_ip>:3000
```

---

## 🔐 Requirements

* Terraform CLI
* Cloud CLI credentials (AWS, GCP, etc.)
* Docker or system packages installed on VM (if not using Kubernetes)
* Optional: firewall or ingress rules to expose ports

---

## 🧠 Why Use a Monitoring Stack?

| Tool          | Role                             |
| ------------- | -------------------------------- |
| Prometheus    | Time-series metrics collector    |
| Grafana       | Visual dashboards + alerts       |
| Node Exporter | Reports system stats             |
| cAdvisor      | Monitors containers (Docker/K8s) |

---

## 📊 What You Can Monitor

* CPU, memory, disk usage of nodes or VMs
* ML service uptime and latency
* Pipeline resource usage (e.g. Nextflow jobs)
* Docker/Kubernetes container metrics
* Network IO and system errors

---
📝 Notes
You must include these two Helm values files in your folder:

values-prometheus.yaml

values-grafana.yaml

Access is typically via kubectl port-forward (Grafana default login: admin/admin).

You need to have:


```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo add grafana https://grafana.github.io/helm-charts
```
