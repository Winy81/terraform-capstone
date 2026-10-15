variable "ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID for the bastion host"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the bastion host"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
