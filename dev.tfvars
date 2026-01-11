env            = "dev"
region         = "ap-south-1"
vpc_cidr_block = "10.75.0.0/16"

public_subnet  = ["10.75.0.0/20", "10.75.16.0/20", "10.75.32.0/20"]
private_subnet = ["10.75.48.0/20", "10.75.64.0/20", "10.75.80.0/20"]


# EKS
is_eks_cluster_enabled     = true
cluster_version            = "1.34"
cluster_name               = "my-cluster"
endpoint_private_access    = true
endpoint_public_access     = false
ondemand_instance_types    = ["t3a.medium"]
spot_instance_types        = ["c5a.large", "c5a.xlarge", "m5a.large", "m5a.xlarge", "c5.large", "m5.large", "t3a.large", "t3a.xlarge", "t3a.medium"]
desired_capacity_on_demand = "1"
min_capacity_on_demand     = "1"
max_capacity_on_demand     = "5"
desired_capacity_spot      = "1"
min_capacity_spot          = "1"
max_capacity_spot          = "10"
addons = [
  {
    name    = "vpc-cni",
    version = "v1.20.0-eksbuild.1"
  },
  {
    name    = "coredns"
    version = "v1.12.2-eksbuild.4"
  },
  {
    name    = "kube-proxy"
    version = "v1.34.0-eksbuild.2"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.46.0-eksbuild.1"
  }
  # Add more addons as needed
]




bastion_image_id      = "ami-0c44f651ab5e9285f" # change this to your own ami id
bastion_instance_type = "t2.micro"
bastion_tags          = { Name = "bastion-dev" }
bastion_key_name      = "new-keypair" # create your own key pair

tags = {
  Project     = "vpc-alb"
  Environment = "dev"
}
