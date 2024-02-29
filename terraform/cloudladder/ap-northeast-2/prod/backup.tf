data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket = "cloudwave-cloudladder-tfstate"
    key = "infra/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

resource "aws_iam_role" "db_backup" {
  name = "db_backup"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "export.rds.amazonaws.com"
        }
      },
    ]
  })
}

data "aws_iam_policy_document" "db_backup" {
  statement {
    actions = [
      "s3:ListAllMyBuckets",
    ]
    resources = [
      "*"
    ]
  }
  statement {
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
    resources = [
      data.terraform_remote_state.s3.outputs.s3_backup_arn
    ]
  }
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = [
      "${data.terraform_remote_state.s3.outputs.s3_backup_arn}/*"
    ]
  }
}

resource "aws_iam_policy" "db_backup" {
  name   = "db_backup"
  policy = data.aws_iam_policy_document.db_backup.json
}

resource "aws_iam_role_policy_attachment" "db_backup" {
  role       = aws_iam_role.db_backup.name
  policy_arn = aws_iam_policy.db_backup.arn
}

resource "aws_kms_key" "db_backup" {
  deletion_window_in_days = 10
}

resource "aws_db_snapshot" "db_backup_users" {
  db_instance_identifier = aws_db_instance.mysql_users.identifier
  db_snapshot_identifier = "cloudwave-users-backup"
}

resource "aws_rds_export_task" "db_backup_users" {
  export_task_identifier = "ap-cloudwave-2-db-backup-users"
  source_arn             = aws_db_snapshot.db_backup_users.db_snapshot_arn
  s3_bucket_name         = "ap-northeast-2-cloudladder-backup"
  iam_role_arn           = aws_iam_role.db_backup.arn
  kms_key_id             = aws_kms_key.db_backup.arn

  export_only = ["database"]
  s3_prefix   = "users/db_backup"
}

resource "aws_db_snapshot" "db_backup_orders" {
  db_instance_identifier = aws_db_instance.mysql_orders.identifier
  db_snapshot_identifier = "cloudwave-orders-backup"
}

resource "aws_rds_export_task" "db_backup_orders" {
  export_task_identifier = "ap-cloudwave-2-db-backup-orders"
  source_arn             = aws_db_snapshot.db_backup_orders.db_snapshot_arn
  s3_bucket_name         = "ap-northeast-2-cloudladder-backup"
  iam_role_arn           = aws_iam_role.db_backup.arn
  kms_key_id             = aws_kms_key.db_backup.arn

  export_only = ["database"]
  s3_prefix   = "orders/db_backup"
}