variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "sudheer-demo"
}

variable "cluster_role" {
  description = "Name of EKS Cluster role to be used"
  type        = string
  default     = "EKSClusterRoleDemo"
}

variable "node_group_name" {
  description = "Assign name for the Node Group"
  type        = string
}

variable "nodegroup_keypair" {
  description = "Node group SSH keypair name"
  type        = string
}

variable "node_role_name" {
  description = "Role name for Node Group in eks cluster"
  type        = string
}

variable "region_name" {
  description = "Region name to launch VPC network"
  type        = string
}

variable "vpc_cidr_block" {
  description = "VPC network CIDR"
  type        = string
}

variable "environment" {
  description = "Environment name for deployment"
  type        = string
}

variable "public_subnets" {
  description = "Provider public subnets CIDR values"
  type        = map(any)
}

variable "private_subnets" {
  description = "Provide private subnets CIDR values"
  type        = map(any)
}