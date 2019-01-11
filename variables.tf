variable "environment" {
  description = "Environment of the Stack"
  default     = ""
}

variable "project" {
  description = "Specify to which project this resource belongs"
  default     = ""
}

variable "region" {
  description = "Default Region for Cloud Analytics Platform"
  default     = "eu-west-1"
}

variable "s3_bucket_name" {
  description = "Name of the bucket"
}

variable "s3_bucket_acl" {
  description = "Private or Public"
  default     = "private"
}

variable "allow_terraform_destroy" {
  description = "Whether to allow terraform to destroy the bucket if someone runs a 'terraform destroy' command"
  default     = false
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 10 days."
  default     = 10
}

variable "kms_key_alias" {
  description = "KMS key alias"
}

variable "versioning_enabled" {
  default = false
}

variable "mfa_delete_enabled" {
  default = true
}

variable "transition_lifecycle_rule_enabled" {
  default = false
}

variable "transition_lifecycle_rule_prefix" {
  default = ""
}

variable "expiration_lifecycle_rule_enabled" {
  default = false
}

variable "expiration_lifecycle_rule_prefix" {
  default = ""
}

variable "noncurrent_version_transition_days" {
  description = "(Optional) Specifies when noncurrent object versions transitions"
  default     = "30"
}

variable "standard_transition_days" {
  description = "Number of days to persist in the standard storage tier before moving to the infrequent access tier"
  default     = "30"
}

variable "glacier_transition_days" {
  description = "Number of days after which to move the data to the glacier storage tier"
  default     = "60"
}

variable "expiration_days" {
  description = "Number of days after which to expunge the objects"
  default     = "90"
}

variable "noncurrent_version_expiration_days" {
  description = "(Optional) Specifies when noncurrent object versions expire."
  default     = "90"
}
