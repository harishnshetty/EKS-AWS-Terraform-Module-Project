locals {
  org = "ap-medium"
  env = var.env
}

module "eks" {
  source = "modules/eks"

  env          = var.env
  cluster-name = "${local.env}-${local.org}-${var.cluster_name}"
  cidr-block   = var.vpc-cidr-block


  is_eks_role_enabled           = true
  is_eks_nodegroup_role_enabled = true
  ondemand_instance_types       = var.ondemand_instance_types
  spot_instance_types           = var.spot_instance_types
  desired_capacity_on_demand    = var.desired_capacity_on_demand
  min_capacity_on_demand        = var.min_capacity_on_demand
  max_capacity_on_demand        = var.max_capacity_on_demand
  desired_capacity_spot         = var.desired_capacity_spot
  min_capacity_spot             = var.min_capacity_spot
  max_capacity_spot             = var.max_capacity_spot
  is-eks-cluster-enabled        = var.is-eks-cluster-enabled
  cluster-version               = var.cluster-version
  endpoint-private-access       = var.endpoint-private-access
  endpoint-public-access        = var.endpoint-public-access

  addons = var.addons
}


module "bastion" {
  source = "modules/bastion"

  image_id        = var.bastion_image_id
  instance_type   = var.bastion_instance_type
  subnet_id       = module.vpc.alb_subnet_public[0]
  security_groups = [module.sg.bastion_sg_id]
  key_name        = var.bastion_key_name

  depends_on = [module.sg]

  tags = {
    Name        = "bastion-${terraform.workspace}"
    Environment = "${terraform.workspace}"
    Project     = "vpc-alb"
    Tier        = "bastion"
  }
}
