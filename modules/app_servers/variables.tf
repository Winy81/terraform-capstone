variable "ami_id" {
  description = "AMI ID for the application servers"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs by availability zone"
  type        = map(string)
}

variable "security_group_id" {
  description = "Application security group ID"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
