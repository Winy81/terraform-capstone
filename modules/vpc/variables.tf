variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}
