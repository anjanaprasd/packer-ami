variable login_user {
  type    = string
  default = "null"
}

variable launch_instance {
  type        = string
  default     = "t3.micro"
  description = "t2.micro instance is not supported"
}

variable ebs_volume_type {
  type        = string
  default     = "gp3"
  description = "ebs volume type"
}

variable "ami_name" {
  type    = string
  default = "packer-aws-ami"
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "region" {
  type    = string
  default = "us-east-1"
}


variable "mount_size" {
  type    = number
  default = 30
}


variable "ec2_role" {
  type    = string
  default = "null"
}