variable "hpc_host" {
  description = "Hostname or IP of the HPC login node"
}

variable "hpc_user" {
  description = "Username for SSH access to the HPC"
}

variable "hpc_ssh_port" {
  default     = 22
  description = "SSH port number"
}

variable "ssh_private_key" {
  description = "Path to your private SSH key file"
}


