variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
}
