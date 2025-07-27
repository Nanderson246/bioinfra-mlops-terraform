output "container_name" {
  value = docker_container.ml_app_container.name
}

output "image_id" {
  value = docker_image.ml_app_image.image_id
}

output "app_url" {
  value = "http://localhost:${var.container_external_port}"
}

