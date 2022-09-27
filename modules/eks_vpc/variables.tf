locals {
  subnet_common_tags = {
    "kubernetes.io/cluster/var.cluster_name" = "shared"
  }
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
  type        = list(string)
}

variable "private_subnets" {
  description = "Provide private subnets CIDR values"
  type        = list(string)
}

variable "public_az" {
  description = "AZ names for public subnets"
  type        = list(string)
}

variable "private_az" {
  description = "AZ names for private subnets"
  type        = list(string)
}

variable "pub_sub_tags" {
  description = "Provide tags that needs to be as part of EKS network to manage ELB internet-facing"
  type        = map(any)
  default = {
    "kubernetes.io/role/elb" = "1"
  }
}

variable "priv_sub_tags" {
  description = "Provide tags that needs to be as part of EKS network to manage ELB internal-elb"
  type        = map(any)
  default = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}