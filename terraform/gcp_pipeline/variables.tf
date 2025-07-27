variable "gcp_project" {
  description = "Your GCP project ID"
  type        = string
  default     = "your-gcp-project-id"
}

variable "gcp_region" {
  description = "GCP region to deploy resources in"
  type        = string
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "GCP zone (used for compute instance)"
  type        = string
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "Name for the VM instance"
  type        = string
  default     = "bio-vm"
}

variable "machine_type" {
  description = "GCP compute instance type"
  type        = string
  default     = "e2-standard-4"
}

# Optional for GPU if needed later
# variable "gpu_type" {
#   default = "nvidia-tesla-t4"
# }

# variable "gpu_count" {
#   default = 1
# }

