output "vpc_name" {
  description = "Display name of the VPC network for EKS Cluster"
  value       = aws_vpc.eks_vpc.id
}

output "pub_subnets" {
  description = "List Public subnets that will be used by EKS Cluster"
  value       = aws_subnet.eks_public_subnets.*.id
}

output "priv_subnets" {
  description = "List Private subnets that will be used by EKS Cluster"
  value       = aws_subnet.eks_private_subnets.*.id
}

output "sg_name" {
  description = "List security group name used for EKS Cluster control plane"
  value       = aws_security_group.default_group.id
}