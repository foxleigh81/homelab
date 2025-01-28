terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"  # Use a stable version or the latest
    }
  }

  cloud {
    organization = "the-foxnet"

    workspaces {
      name = "homelab"
    }
  }
}

provider "docker" {
    host = "tcp://10.56.1.30:2376"
}