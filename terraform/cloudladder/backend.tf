# main.tf

provider "aws" {
  region = "ap-northeast-2"  # Update with your desired region
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "cloudwave-cloudladder-tfstate"

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = false
    }
}

resource "aws_dynamodb_table" "terraform_lock" {
	name = "cloudwave-cloudladder-tflock"
    hash_key = "LockID"
    read_capacity = 2
    write_capacity = 2
    
    attribute {
    	name = "LockID"
        type = "S"
    }
}

terraform {
    backend "s3" {
        bucket = "cloudwave-cloudladder-tfstate"
        key = "global/terraform.tfstate"
        region = "ap-northeast-2"
        encrypt = true
        dynamodb_table = "cloudwave-cloudladder-tflock"
    }
}
