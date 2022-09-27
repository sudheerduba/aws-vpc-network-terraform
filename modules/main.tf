module "eks_vpc" {
  source = "./eks_vpc"
}

module "eks_cluster" {
  source = "./eks_cluster"

  eks_subnet_ids = flatten([module.eks_vpc.pub_subnets, module.eks_vpc.priv_subnets])
  cluster_role   = var.eks_cluster_role

  depends_on = [
    module.eks_vpc
  ]
}

module "eks_node_group" {
  source = "./eks_node_group"

  eks_subnet_ids   = flatten([module.eks_vpc.pub_subnets, module.eks_vpc.priv_subnets])
  eks_cluster_name = module.eks_cluster.cluster_name

  depends_on = [
    module.eks_cluster,
    module.eks_vpc
  ]
}