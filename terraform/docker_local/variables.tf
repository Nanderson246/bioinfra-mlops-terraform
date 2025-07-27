variable "image_name" {
  default = "mlapp:latest"
}

variable "container_name" {
  default = "mlapp_container"
}

variable "docker_context" {
  default = "../docker"
}

variable "dockerfile_path" {
  default = "../docker/Dockerfile"
}

variable "container_internal_port" {
  default = 5000
}

variable "container_external_port" {
  default = 5000
}

