variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_id" {
  description = "ALB security group ID"
  type        = string
}

variable "app_instance_ids" {
  description = "Application instance IDs"
  type        = list(string)
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
