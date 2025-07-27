variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  default     = "us-central1"
}

variable "cluster_name" {
  default = "bioinfra-gke-cluster"
}

variable "network" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork" {
  description = "VPC subnetwork name"
  type        = string
}

variable "node_count" {
  default = 2
}

variable "machine_type" {
  default = "e2-medium"
}

