provider "google" {
  project     = var.project_id
  region      = "europe-west8-a"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

terraform {
  backend "gcs" {
    bucket = "king-tfstate"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}