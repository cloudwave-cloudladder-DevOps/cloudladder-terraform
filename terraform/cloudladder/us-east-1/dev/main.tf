#main.tf

provider "aws" {
  region = var.region
  default_tags {
    tags = local.tags
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
    helm = {
      source  = "hashicorp/helm"
    }
  }
}

locals {
  tags = {
    created-by = "kyh"
  }
}


terraform {
    backend "s3" {
        bucket = "cloudwave-cloudladder-tfstate"
        key = "us-dev/terraform.tfstate"
        region = "ap-northeast-2"
        encrypt = true
        dynamodb_table = "cloudwave-cloudladder-tflock"
    }
}