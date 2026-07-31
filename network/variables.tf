variable "region" {
  description = "The AWS Region where resource will be deployed."
  type        = string

  validation {
    condition     = contains(["ap-southeast-2", "us-east-1"], var.region)
    error_message = "The region must be either 'ap-southeast-2' or 'us-east-1'"
  }
}

variable "cidr" {
  description = "The CIDR block for the main VPC."
  type        = string

  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "The CIDR block range must be valid IPv4 CIDR block (e.g., 10.0.0.1/16)"
  }
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  type        = string

  validation {
    condition     = can(cidrhost(var.private_subnet_cidr, 0))
    error_message = "The CIDR block range must be valid IPv4 CIDR block (e.g., 10.0.0.1/16)"
  }
}