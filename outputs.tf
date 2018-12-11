output "s3_arn" {
  value = "${aws_s3_bucket.this.arn}"
}

output "s3_id" {
  value = "${aws_s3_bucket.this.id}"
}

output "s3_bucket" {
  value = "${aws_s3_bucket.this.bucket}"
}

output "s3_bucket_domain_name" {
  value = "${aws_s3_bucket.this.bucket_domain_name}"
}

output "s3_region" {
  value = "${aws_s3_bucket.this.region}"
}

output "s3_versioning" {
  value = "${aws_s3_bucket.this.versioning}"
}

output "s3_tags" {
  value = "${aws_s3_bucket.this.tags}"
}

output "aws_kms_key_arn" {
  value = "${aws_kms_key.this.arn}"
}

output "aws_kms_key_is_enabled" {
  value = "${aws_kms_key.this.is_enabled}"
}

output "aws_kms_key_id" {
  value = "${aws_kms_key.this.key_id}"
}

output "aws_kms_alias_arn" {
  value = "${aws_kms_alias.this.arn}"
}

output "aws_kms_alias_name" {
  value = "${aws_kms_alias.this.name}"
}

output "aws_kms_alias_id" {
  value = "${aws_kms_alias.this.id}"
}
