locals {
  node_policy_arn = {
    "node_policy" = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    "acr_policy"  = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    "cni_policy"  = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  }
}

variable "node_group_name" {
  description = "Assign name for the Node Group"
  type        = string
}

variable "node_role_name" {
  description = "Role name for Node Group in eks cluster"
  type        = string
}

variable "nodegroup_keypair" {
  description = "Key pair name to attach for EC2 nodes in Node group"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of EKS Cluster, pulled from eks_cluster module"
  type        = string
}

variable "eks_subnet_ids" {
  description = "List subnet ids on which EKS Cluster to be launched"
  type        = list(string)
}