terraform {
  required_providers {
    docker = {
      source = "registry.terraform.io/kreuzwerker/docker"
      version = "3.0.2"
    }
  }
  required_version = ">= 1.10.3"
}

resource "docker_image" "ph_backend" {
    name = "ph_backend"
    build {
        context = "../productheim-api/" # relative to the directory (productheim/mrofarret/) 
                                        # from where the terraform command is running
        tag = ["productheim-backend:develop"]
    }
    keep_locally = false
}

resource "docker_container" "ph_backend_container" {
  image = docker_image.ph_backend.image_id
  name = var.container_name
  memory = 256
  ports {
    internal = 8080
    external = 8085
  }
}