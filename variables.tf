variable "cidr_block" {
  type        = list(string)
  description = "The list of CIDR blocks for the VPC"
}

variable "name" {
  type        = string
  description = "The name of the VPC"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Enable public IP on launch"
}
