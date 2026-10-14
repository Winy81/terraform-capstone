variable "vpc_id" {
  description = "VPC ID where the security groups are created"
  type        = string
}

variable "admin_ip" {
  description = "Public IP allowed to SSH to the bastion"
  type        = string
}

variable "default_route_cidr" {
  description = "Default CIDR used for outbound traffic"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
