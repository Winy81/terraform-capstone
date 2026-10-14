terraform {

  required_version = ">= 1.5.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.19"
    }

  }
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  default_route_cidr  = var.default_route_cidr

  common_tags = local.common_tags
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id             = module.vpc.vpc_id
  admin_ip           = var.admin_ip
  default_route_cidr = var.default_route_cidr
  common_tags        = local.common_tags
}
