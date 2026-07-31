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

variable "cidr" {
  description = "The CIDR block for the main VPC."
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "The CIDR block range must be valid IPv4 CIDR block (e.g., 10.0.0.1/16)"
  }
}