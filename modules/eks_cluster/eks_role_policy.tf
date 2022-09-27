resource "aws_iam_role" "eks_cluster_role" {
  name = var.cluster_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "EKSASSUMEROLE"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    local.common_tags,
    {
      Name = "eks-cluster-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "eks_clusterpolicy_attach" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = var.eks_cluster_policy_arn
}