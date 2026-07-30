variable "region" {
  description = "The AWS Region where resource will be deployed."
  type        = string
  default     = "ap-southeast-2"

  validation {
    condition     = contains(["ap-southeast-2", "us-east-1"], var.region)
    error_message = "The region must be either 'ap-southeast-2' or 'us-east-1'"
  }
}

variable "environment" {
  description = "The deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The deployment environment must be 'dev', 'staging', or 'prod'."
  }
}