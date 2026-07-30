terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.57"
    }
  }

  required_version = ">= 1.15.8"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "ssm-vpcendpoint"
      Owner       = "panduhimal"
      ManagedBy   = "terraform"
      Environment = var.environment
    }
  }
}