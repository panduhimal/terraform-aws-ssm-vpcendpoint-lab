module "vpc" {
  source = "./network"

  cidr = var.cidr
}