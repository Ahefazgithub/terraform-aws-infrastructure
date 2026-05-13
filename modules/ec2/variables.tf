variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_sg_id" {
  description = "EC2 security group ID"
  type        = string
}

variable "ec2_instance_profile_name" {
  description = "IAM instance profile name"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID"
  type        = string
}
