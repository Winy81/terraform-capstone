variable "ami_id" {
  description = "AMI ID for the application servers"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_az1_subnet_id" {
  description = "Private subnet ID for AZ1"
  type        = string
}

variable "private_az2_subnet_id" {
  description = "Private subnet ID for AZ2"
  type        = string
}

variable "private_az3_subnet_id" {
  description = "Private subnet ID for AZ3"
  type        = string
}

variable "security_group_id" {
  description = "Application security group ID"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
