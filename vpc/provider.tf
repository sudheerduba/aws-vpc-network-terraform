terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region_name

  default_tags {
    tags = {
      "Application" = "Kubernetes"
      "Tool"        = "Terragrunt-managed-resource"
    }
  }
}