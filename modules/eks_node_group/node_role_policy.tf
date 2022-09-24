resource "aws_iam_role" "node_role" {
  name = var.node_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "AssumeNodeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "node_policy_attach" {
  count      = length(local.node_policy_arn)
  policy_arn = element(values(local.node_policy_arn), count.index)
  role       = aws_iam_role.node_role.name

  depends_on = [
    aws_iam_role.node_role
  ]
}