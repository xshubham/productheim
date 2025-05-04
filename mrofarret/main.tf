terraform {
  required_providers {
    docker = {
      source = "registry.terraform.io/kreuzwerker/docker"
      version = "3.0.2"
    }
  }
  required_version = ">= 1.10.3"
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

module "productheim_backend" {
    source = "./modules/backend-module"
    container_name = "productheim-backend"
}