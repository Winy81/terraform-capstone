variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs by availability zone"
  type        = map(string)
}

variable "app_instance_ids" {
  description = "Application instance IDs by availability zone"
  type        = map(string)
}

variable "security_group_id" {
  description = "ALB security group ID"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
