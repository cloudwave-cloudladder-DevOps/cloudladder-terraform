data "terraform_remote_state" "acm" {
  backend = "s3"
  config = {
    bucket = "cloudwave-cloudladder-tfstate"
    key = "infra/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

# Bastion EC2 Instance
resource "aws_instance" "bastion" {
  ami                    = "ami-097bf0ec147165215"
  instance_type          = "t2.micro"
  key_name               = "cloudladder"
  subnet_id              = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = [aws_security_group.bastion.id]

  tags = {
    Name = "dev-bastion"
  }

  associate_public_ip_address = true
}

# VPN for Bastion EC2 Instance
resource "aws_ec2_client_vpn_endpoint" "dev_vpn" {
  description            = "dev-vpn"
  server_certificate_arn = data.terraform_remote_state.acm.outputs.dev_request_cert
  client_cidr_block      = var.vpc_cidr
  vpc_id                 = module.vpc.vpc_id

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = data.terraform_remote_state.acm.outputs.dev_request_cert
  }

  connection_log_options {
    enabled               = false
  }
  tags = {
    Name = "dev-vpn"
  }
}

# Security Group for Bastion
resource "aws_security_group" "bastion" {
  name        = var.name
  description = "Security group for bastion"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 필요에 따라 CIDR 블록 수정
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 트래픽 허용 또는 필요에 따라 변경
  }
  tags = {
    Name = "dev-bastion"
  }
}