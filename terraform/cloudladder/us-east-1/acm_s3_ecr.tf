#acm.tf

resource "aws_acmpca_certificate_authority" "cloudladderdev" {
 type = "ROOT"

 certificate_authority_configuration {
  key_algorithm   = "RSA_2048"
  signing_algorithm = "SHA512WITHRSA"

  subject {
   common_name = "cloudladderdev.com"
  }
 }
 permanent_deletion_time_in_days = 7
}

resource "aws_acmpca_certificate" "cloudladderdev" {
 certificate_authority_arn  = aws_acmpca_certificate_authority.cloudladderdev.arn
 certificate_signing_request = aws_acmpca_certificate_authority.cloudladderdev.certificate_signing_request
 signing_algorithm      = "SHA512WITHRSA"
 template_arn = "arn:${data.aws_partition.current.partition}:acm-pca:::template/RootCACertificate/V1"

 validity {
  type = "YEARS"
  value = 3
 }
}


data "aws_partition" "current" {}

resource "aws_acmpca_permission" "dev_private_ca_permission" {
  certificate_authority_arn = aws_acmpca_certificate_authority.cloudladderdev.arn
  actions                   = ["IssueCertificate", "GetCertificate", "ListPermissions"]
  principal                 = "acm.amazonaws.com"
}

resource "aws_acmpca_certificate_authority_certificate" "cloudladderdev" {
 certificate_authority_arn = aws_acmpca_certificate_authority.cloudladderdev.arn
 certificate    = aws_acmpca_certificate.cloudladderdev.certificate
 certificate_chain = aws_acmpca_certificate.cloudladderdev.certificate_chain
}

resource "time_sleep" "dev_wait_30_seconds" {
  create_duration = "30s"
  depends_on      = [aws_acmpca_certificate_authority_certificate.cloudladderdev]
}

resource "aws_acm_certificate" "dev_request_cert" {
  domain_name               = "cloudladderdev.com"
  certificate_authority_arn = aws_acmpca_certificate_authority.cloudladderdev.arn
  key_algorithm             = "RSA_2048"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [time_sleep.dev_wait_30_seconds]
}

#acm.tf

resource "aws_acmpca_certificate_authority" "cloudladderprod" {
 type = "ROOT"

 certificate_authority_configuration {
  key_algorithm   = "RSA_2048"
  signing_algorithm = "SHA512WITHRSA"

  subject {
   common_name = "cloudladderprod.com"
  }
 }
 permanent_deletion_time_in_days = 7
}

resource "aws_acmpca_certificate" "cloudladderprod" {
 certificate_authority_arn  = aws_acmpca_certificate_authority.cloudladderprod.arn
 certificate_signing_request = aws_acmpca_certificate_authority.cloudladderprod.certificate_signing_request
 signing_algorithm      = "SHA512WITHRSA"

 template_arn = "arn:${data.aws_partition.current.partition}:acm-pca:::template/RootCACertificate/V1"

 validity {
  type = "YEARS"
  value = 3
 }
}

resource "aws_acmpca_permission" "prod_private_ca_permission" {
  certificate_authority_arn = aws_acmpca_certificate_authority.cloudladderprod.arn
  actions                   = ["IssueCertificate", "GetCertificate", "ListPermissions"]
  principal                 = "acm.amazonaws.com"
}

resource "aws_acmpca_certificate_authority_certificate" "cloudladderprod" {
 certificate_authority_arn = aws_acmpca_certificate_authority.cloudladderprod.arn
 certificate    = aws_acmpca_certificate.cloudladderprod.certificate
 certificate_chain = aws_acmpca_certificate.cloudladderprod.certificate_chain
}

resource "time_sleep" "prod_wait_30_seconds" {
  create_duration = "30s"
  depends_on      = [aws_acmpca_certificate_authority_certificate.cloudladderprod]
}

resource "aws_acm_certificate" "prod_request_cert" {
  domain_name               = "cloudladderprod.com"
  certificate_authority_arn = aws_acmpca_certificate_authority.cloudladderprod.arn
  key_algorithm             = "RSA_2048"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [time_sleep.prod_wait_30_seconds]
}

output "dev_request_cert" {
  value       = aws_acm_certificate.dev_request_cert.arn
  description = "prod_request_cert"
}

output "prod_request_cert" {
  value       = aws_acm_certificate.prod_request_cert.arn
  description = "prod_request_cert"
}

###########################ecr.tf###################

resource "aws_ecr_repository" "java_repository" {
  name = "java_cloudladder"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "java_repository_url" {
  description = "The URL of the repository."
  value = aws_ecr_repository.java_repository.repository_url
}

resource "aws_ecr_repository" "node_repository" {
  name = "node_cloudladder"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "node_repository_url" {
  description = "The URL of the repository."
  value = aws_ecr_repository.node_repository.repository_url
}

##########################s3##########################

resource "aws_s3_bucket" "personalize" {
    bucket = var.s3_personalize_id

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = false
    }
}

resource "aws_s3_bucket" "static" {
    bucket = var.s3_static_id

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = false
    }
}

resource "aws_s3_bucket" "backup" {
    bucket = var.s3_backup_id

    versioning {
        enabled = true
    }

    lifecycle {
        prevent_destroy = false
    }
}

output "s3_backup_arn" {
  description = "The arn of the backup s3."
  value = aws_s3_bucket.backup.arn
}
output "s3_backup_id" {
  description = "The id of the backup s3."
  value = aws_s3_bucket.backup.id
}