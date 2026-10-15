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

  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  default_route_cidr = var.default_route_cidr

  nat_gateway_subnet_key = var.nat_gateway_subnet_key

  common_tags = local.common_tags
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id             = module.vpc.vpc_id
  admin_ip           = var.admin_ip
  default_route_cidr = var.default_route_cidr
  common_tags        = local.common_tags
}

module "bastion" {
  source = "./modules/bastion"

  ami_id            = data.aws_ami.amazon_linux.id
  instance_type     = var.instance_type
  subnet_id = module.vpc.public_subnet_ids["az1"]
  security_group_id = module.security_groups.bastion_security_group_id
  common_tags       = local.common_tags
}

module "app_servers" {
  source = "./modules/app_servers"

  ami_id        = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  private_subnet_ids = module.vpc.private_subnet_ids

  security_group_id = module.security_groups.app_security_group_id
  common_tags       = local.common_tags
}

module "alb" {
  source = "./modules/alb"

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.vpc.public_subnet_ids

  security_group_id = module.security_groups.alb_security_group_id

  app_instance_ids = module.app_servers.instance_ids

  common_tags = local.common_tags
}
