terraform {
  required_version = ">= 1.8.5, < 2.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }
  backend "remote" {
    organization = "fulya-demo"

    workspaces {
      name = "fulya-webstack"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

