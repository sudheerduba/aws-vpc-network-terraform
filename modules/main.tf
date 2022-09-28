module "eks_vpc" {
  source = "./eks_vpc"

  environment     = var.environment
  region_name     = var.region_name
  vpc_cidr_block  = var.vpc_cidr_block
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "eks_cluster" {
  source = "./eks_cluster"

  eks_subnet_ids   = flatten([module.eks_vpc.pub_subnets, module.eks_vpc.priv_subnets])
  eks_cluster_name = var.eks_cluster_name
  cluster_role     = var.cluster_role

  depends_on = [
    module.eks_vpc
  ]
}

module "eks_node_group" {
  source = "./eks_node_group"

  eks_subnet_ids    = flatten([module.eks_vpc.pub_subnets, module.eks_vpc.priv_subnets])
  eks_cluster_name  = module.eks_cluster.cluster_name
  node_group_name   = var.node_group_name
  node_role_name    = var.node_role_name
  nodegroup_keypair = var.nodegroup_keypair

  depends_on = [
    module.eks_cluster,
    module.eks_vpc
  ]
}