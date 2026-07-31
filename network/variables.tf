variable "cidr" {
  description = "The CIDR block for the main VPC."
  type        = string

  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "The CIDR block range must be valid IPv4 CIDR block (e.g., 10.0.0.1/16)"
  }
}