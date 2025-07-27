terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "ml_app_image" {
  name         = var.image_name
  build {
    context    = var.docker_context
    dockerfile = var.dockerfile_path
  }
}

resource "docker_container" "ml_app_container" {
  name  = var.container_name
  image = docker_image.ml_app_image.image_id

  ports {
    internal = var.container_internal_port
    external = var.container_external_port
  }
}

