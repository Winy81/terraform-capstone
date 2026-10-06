locals {

  common_tags = {
    Project = "terraform-capstone"
    Owner   = "Adam"
  }

  public_subnets = {
    az1 = var.public_subnet_cidrs[0]
    az2 = var.public_subnet_cidrs[1]
    az3 = var.public_subnet_cidrs[2]
  }

  private_subnets = {
    az1 = var.private_subnet_cidrs[0]
    az2 = var.private_subnet_cidrs[1]
    az3 = var.private_subnet_cidrs[2]
  }

}
