variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
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

variable "default_route_cidr" {
  description = "Default route CIDR"
  type        = string
}
