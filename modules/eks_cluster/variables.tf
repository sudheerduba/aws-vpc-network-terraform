variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "eks_subnet_ids" {
  description = "List subnet ids on which EKS Cluster to be launched"
  type        = list(string)
}

variable "cluster_role" {
  description = "Name of EKS Cluster role to be used"
  type        = string
}

variable "eks_cluster_policy_arn" {
  description = "ARN of the policy to assign for EKS Cluster Role"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

locals {
  common_tags = {
    "Appication" = "EKS_Cluster"
  }
}