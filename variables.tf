variable "region" {
  description = "AWS region"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
}

variable "default_route_cidr" {
  description = "Default route CIDR"
  type        = string
}

variable "admin_ip" {
  description = "Public IP allowed to SSH to the bastion host (use x.x.x.x/32)"
  type        = string
}
