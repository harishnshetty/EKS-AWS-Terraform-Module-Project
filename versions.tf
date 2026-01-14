terraform {

  required_version = "~> 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.0"
    }
  }
  # backend "s3" {
  #   bucket         = "dev-harish-eks-cluster-bucket"
  #   region         = "ap-south-1"
  #   key            = "terraform.tfstate"
  #   use_lockfile   = true
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.region
}
