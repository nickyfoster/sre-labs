variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "ec2_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources created"
  type        = map(string)
}

variable "versions" {
  type = object({
    ubuntu = string
  })
  default = {
    ubuntu = "jammy-22.04"
  }
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 15
}

variable "vpn_server_cidr" {
  description = "CIDR block for VPN server access"
  type        = string
}
