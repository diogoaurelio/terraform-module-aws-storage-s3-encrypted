resource "aws_s3_bucket" "this" {
  bucket        = "${length(var.environment) > 0 ? "${var.environment}-": ""}${length(var.project) > 0 ? "${var.project}-": ""}${var.s3_bucket_name}"
  acl           = "${var.s3_bucket_acl}"
  region        = "${var.region}"
  force_destroy = "${var.allow_terraform_destroy}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "${aws_kms_key.this.arn}"
      }
    }
  }

  versioning {
    enabled    = "${var.versioning_enabled}"
    mfa_delete = "${var.mfa_delete_enabled}"
  }

  lifecycle_rule {
    id      = "${length(var.environment) > 0 ? "${var.environment}-": ""}${length(var.project) > 0 ? "${var.project}-": ""}${var.s3_bucket_name}-transition-rule"
    enabled = "${var.transition_lifecycle_rule_enabled}"
    prefix  = "${var.transition_lifecycle_rule_prefix}"

    noncurrent_version_transition {
      days          = "${var.noncurrent_version_transition_days}"
      storage_class = "GLACIER"
    }

    transition {
      days          = "${var.standard_transition_days}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.glacier_transition_days}"
      storage_class = "GLACIER"
    }
  }

  lifecycle_rule {
    id      = "${length(var.environment) > 0 ? "${var.environment}-": ""}${length(var.project) > 0 ? "${var.project}-": ""}${var.s3_bucket_name}-expiration-rule"
    enabled = "${var.expiration_lifecycle_rule_enabled}"
    prefix  = "${var.expiration_lifecycle_rule_prefix}"

    noncurrent_version_expiration {
      days = "${var.noncurrent_version_expiration_days}"
    }

    expiration {
      days = "${var.expiration_days}"
    }
  }

  tags {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.environment}"
    Project     = "${var.project}"
  }
}

resource "aws_kms_key" "this" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  is_enabled              = true

  tags {
    Name        = "bucket-${var.s3_bucket_name}-kms-key"
    Environment = "${var.environment}"
    Project     = "${var.project}"
    Alias       = "${var.kms_key_alias}"
  }
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.kms_key_alias}"
  target_key_id = "${aws_kms_key.this.arn}"
}
