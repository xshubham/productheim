output "container_id" {
    description = "ID of the Docker container"
    value = docker_container.ph_backend_container.id
}

output "image_id" {
    description = "ID of the Docker image"
    value = docker_image.ph_backend.id
}