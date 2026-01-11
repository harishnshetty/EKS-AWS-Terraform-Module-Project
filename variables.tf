#region
variable "region" {
  type = string
}
#VPC
variable "cidr-block" {
  type = list(string)
}
variable "public-subnet" {
  type = list(string)
}
variable "private-subnet" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "env" {
  type = string
}

# EKS
variable "is_eks_cluster_enabled" {}
variable "cluster_version" {}
variable "endpoint_private_access" {}
variable "endpoint_public_access" {}
variable "ondemand_instance_types" {
}

variable "spot_instance_types" {}
variable "desired_capacity_on_demand" {}
variable "min_capacity_on_demand" {}
variable "max_capacity_on_demand" {}
variable "desired_capacity_spot" {}
variable "min_capacity_spot" {}
variable "max_capacity_spot" {}
variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
}
