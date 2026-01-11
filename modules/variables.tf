# VPC
variable "env" {
  type = string
}

variable "vpc_cidr_block" { # Renamed from cidr-block
  type = string             # Changed from list(string)
}

variable "public_subnet" {
  type = list(string)
}
variable "private_subnet" {
  type = list(string)
}



# IAM
variable "is_eks_role_enabled" {
  type = bool
}
variable "is_eks_nodegroup_role_enabled" {
  type = bool
}





# EKS

variable "cluster_name" {
  type = string
}


variable "is_eks_cluster_enabled" {
  type = bool
}
variable "cluster_version" {
  type = string
}
variable "endpoint_private_access" {
  type = bool
}
variable "endpoint_public_access" {
  type = bool
}
variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
}
variable "ondemand_instance_types" {
  type = list(string)
}
variable "spot_instance_types" {
  type = list(string)
}
variable "desired_capacity_on_demand" {
  type = string
}
variable "min_capacity_on_demand" {
  type = string
}
variable "max_capacity_on_demand" {
  type = string
}
variable "desired_capacity_spot" {
  type = string
}
variable "min_capacity_spot" {
  type = string
}
variable "max_capacity_spot" {
  type = string
}



# Bastion

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "key_name" {
  type = string
}
