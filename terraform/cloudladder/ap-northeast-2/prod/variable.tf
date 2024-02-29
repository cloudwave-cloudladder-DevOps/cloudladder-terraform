#variable.tf
variable "region" {
  description = "Name of region"
  type = string
  default = "ap-northeast-2"
}


variable "name" {
  description = "Name of env"
  type = string
  default = "prod"
}

variable "vpc_id" {
  description = "Name of env"
  type = string
  default = "prod-cloudladder"
}

variable "tags" {
  description = "List of tags to be associated with resources."
  default     = {}
}

variable "vpc_cidr" {
  description = "VPC ID used to create EKS cluster."
  type        = string
  default = "10.0.0.0/16"
}