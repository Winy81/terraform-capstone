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

  vpc_cidr = var.vpc_cidr

  common_tags = local.common_tags
}
