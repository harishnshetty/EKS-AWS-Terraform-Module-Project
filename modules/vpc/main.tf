resource "aws_vpc" "eks_vpc" {
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.name
  }
}
