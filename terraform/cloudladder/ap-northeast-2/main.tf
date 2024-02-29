# main.tf

provider "aws" {
  region = "ap-northeast-2"  # Update with your desired region
}

terraform {
    backend "s3" {
        bucket = "cloudwave-cloudladder-tfstate"
        key = "infra/terraform.tfstate"
        region = "ap-northeast-2"
        encrypt = true
        dynamodb_table = "cloudwave-cloudladder-tflock"
    }
}

variable "s3_backup_id" {
  description = "Name of backup s3"
  type = string
  default = "ap-northeast-2-cloudladder-backup"
}

variable "s3_static_id" {
  description = "Name of static s3"
  type = string
  default = "ap-northeast-2-cloudladder-static"

}

variable "s3_personalize_id" {
  description = "Name of personalize s3"
  type = string
  default = "ap-northeast-2-cloudladder-personalize"
}