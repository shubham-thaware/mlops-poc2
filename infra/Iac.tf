module "vpc" {
  source = "git::https://github.com/shubham-thaware/terraform-module.git//aws-vpc"
  env = var.infra_env
  vpc_name = var.app_name
  vpc_cidr_block = var.vpc_cidr_block
  public_subnet_cidr_1 = var.public_subnet_cidr_1
  public_subnet_cidr_2 = var.public_subnet_cidr_2
  private_subnet_cidr_1 = var.private_subnet_cidr_1
  private_subnet_cidr_2 = var.private_subnet_cidr_2
}

module "sg" {
  source = "git::https://github.com/shubham-thaware/terraform-module.git//aws-security-groups"
  vpc_id = module.vpc.vpc_id
  aws_eks_cluster_name = var.app_name
}

module "eks" {
  source = "git::https://github.com/shubham-thaware/terraform-module.git//aws-eks"
  aws_eks_cluster_name = var.app_name
  aws_eks_cluster_version = var.eks_version
  vpc_id = module.vpc.vpc_id
  aws_vpc_private_subnet_ids = module.vpc.private_subnet_ids
  aws_eks_cluster_sg_ids = [module.sg.eks_cluster_sg_id]
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  eks_endpoint_private_access = var.eks_endpoint_private_access
  eks_endpoint_public_access = var.eks_endpoint_public_access
  default_tags = var.default_tags
  node_instance_type = var.node_instance_type
  node_volume_size = var.node_volume_size
  node_desired  = var.node_desired
  node_min  = var.node_min
  node_max  = var.node_max
  create_spot_node_group = var.create_spot_node_group
  spot_instance_types = var.spot_instance_types
  spot_desired_size = var.spot_desired_size
  spot_min_size  = var.spot_min_size
  spot_max_size = var.spot_max_size
  node_labels = var.node_labels
  control_plane_log_types = var.control_plane_log_types
  enable_kms = var.enable_kms
}