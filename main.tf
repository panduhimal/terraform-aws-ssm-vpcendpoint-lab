module "vpc" {
  source = "./network"

  region              = var.region
  cidr                = var.cidr
  private_subnet_cidr = var.private_subnet_cidr
}