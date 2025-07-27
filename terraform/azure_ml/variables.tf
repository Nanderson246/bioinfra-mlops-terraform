variable "resource_group_name" {
  default = "mlops-resource-group"
}

variable "location" {
  default = "eastus"
}

variable "vm_name" {
  default = "bioinfra-ml-vm"
}

variable "vm_size" {
  default = "Standard_B2s"
}

variable "admin_username" {
  default = "azureuser"
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

