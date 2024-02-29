#database.tf

locals {
  public_subnets    = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k)]
  private_subnets   = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 3)]
  database_subnets  = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 6)]
  azs               = slice(data.aws_availability_zones.available.names, 0, 3)
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.1"

  name = var.vpc_id
  cidr = var.vpc_cidr

  azs                   = local.azs
  public_subnets        = local.public_subnets
  private_subnets       = local.private_subnets
  database_subnets      = local.database_subnets
  
  public_subnet_suffix    = "SubnetPublic"
  private_subnet_suffix   = "SubnetPrivate"
  database_subnet_suffix = "SubnetDatabase"

  enable_nat_gateway   = true
  create_igw           = true
  enable_dns_hostnames = true
  single_nat_gateway   = true

  # Manage so we can name
  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${var.vpc_id}-default" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${var.vpc_id}-default" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${var.vpc_id}-default" }

  public_subnet_tags = merge(local.tags, {
    "kubernetes.io/role/elb" = "1"
  })
  private_subnet_tags = merge(local.tags, {
    "karpenter.sh/discovery" = var.vpc_id
  })

  tags = local.tags
}

# Create a KMS key for Redis encryption
resource "aws_kms_key" "database" {
  description             = "Database KMS Key"
  enable_key_rotation     = true
}

# Create a security group for the databases within the VPC
resource "aws_security_group" "database" {
  name        = "${var.vpc_id}-sg"
  description = "Security group for databases"
  vpc_id      = module.vpc.vpc_id  # Specify the VPC ID
  # Add your security group rules as needed
  # 인바운드 규칙 (Inbound Rules)
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 특정 IP 범위 또는 필요에 따라 변경
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 특정 IP 범위 또는 필요에 따라 변경
  }

  # 아웃바운드 규칙 (Outbound Rules)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 트래픽 허용 또는 필요에 따라 변경
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.vpc_id}-subnet-group"
  subnet_ids = module.vpc.database_subnets
  tags       = local.tags
}

resource "aws_db_instance" "mysql_orders" {
  identifier            = "${var.vpc_id}-mysql-orders"
  allocated_storage    = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "8.0.35"
  instance_class        = "db.t3.micro"
  username              = "admin"
  password              = "password"
  db_subnet_group_name  = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database.id]
  publicly_accessible   = false
  storage_encrypted     = true
  skip_final_snapshot       = true
  tags                  = local.tags
}

resource "aws_db_instance" "mysql_users" {
  identifier            = "${var.vpc_id}-mysql-users"
  allocated_storage    = 20
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "8.0.35"
  instance_class        = "db.t3.micro"
  username              = "admin"
  password              = "password"
  db_subnet_group_name  = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database.id]
  publicly_accessible   = false
  storage_encrypted     = true
  skip_final_snapshot       = true
  tags                  = local.tags
}

output "mysql_orders_endpoint" {
  value = aws_db_instance.mysql_orders.endpoint
}

output "mysql_catalog_endpoint" {
  value = aws_db_instance.mysql_users.endpoint
}