terraform {
  required_version = "~> 1.8.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "khuedoan"

    workspaces {
      name = "homelab-external"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.35.0"
    }

    b2 = {
      source  = "Backblaze/b2"
      version = "~> 0.8.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "~> 2.2.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "b2" {
  application_key_id = var.b2_application_key_id
  application_key    = var.b2_application_key
}

provider "kubernetes" {
  # Use KUBE_CONFIG_PATH environment variables
  # Or in cluster service account
}
