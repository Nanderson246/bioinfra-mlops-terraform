### 📦 `terraform/hpc_onprem/README.md

📍 Purpose
This folder documents a Terraform module for configuring on-premises High Performance Computing (HPC) infrastructure.

✅ HPC = High Performance Computing
✅ On-premises = infrastructure you control directly (not in the cloud) — such as university clusters, institutional servers, or shared academic computing environments (e.g. SLURM, PBS, LSF, etc.)

Terraform can't provision physical servers, but you can use it to:

Manage shared filesystems (e.g., NFS)

Define local VM environments (e.g., via libvirt)

Template job schedulers or SLURM configs

Standardize user environments or tools

📦 What It Sets Up
This module assumes you're deploying a reproducible software or VM config for a system you already control, like:

An institutional HPC with SSH access

A local cluster with virtualization (KVM/libvirt)

A shared environment where consistent setup is needed

Examples of usage:

Provisioning VMs via libvirt or VirtualBox

Installing ML/bio tools (Nextflow, Snakemake, MLflow) with Ansible or shell

Automating module trees and storage layout

📁 Files
main.tf – Connects to local virtualization or remote HPC node

variables.tf – Cluster-specific paths, usernames, or IPs

outputs.tf – Connection status, paths, or metadata

🚀 Usage
Depends on the backend:

1. If using libvirt (local virtual machines on Linux):
bash
Copy
Edit
sudo apt install libvirt-daemon-system
terraform init
terraform apply
2. If connecting to remote SSH-accessible cluster:
hcl
Copy
Edit
provider "ssh" {
  host     = var.hpc_host
  user     = var.hpc_user
  password = var.hpc_password
}
⚠️ Terraform needs plugins (like terraform-provider-libvirt) for full on-prem integration

🔐 Requirements
Access to the HPC system (credentials or SSH key)

Terraform CLI

Optional: libvirt installed if using local VM provisioning

Optional: Ansible or shell scripts for remote setup

🧠 Why Use This?
Standardize installs across lab machines

Automate HPC tool environments without relying on IT staff

Make bio/ML pipelines portable across cloud and local systems

Stay consistent between local testing and cluster deployment











