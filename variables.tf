variable "region" {
  description = "AWS region"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet configurations by availability zone"

  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Private subnet configurations by availability zone"

  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "nat_gateway_subnet_key" {
  description = "Key of the public subnet containing the NAT Gateway"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "default_route_cidr" {
  description = "Default route CIDR"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "admin_ip" {
  description = "Public IP allowed to SSH to the bastion host (use x.x.x.x/32)"
  type        = string
}
