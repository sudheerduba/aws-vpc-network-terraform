resource "aws_subnet" "eks_public_subnets" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = element(values(var.public_subnets), count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(keys(var.public_subnets), count.index)

  tags = merge(
    var.pub_sub_tags,
    local.subnet_common_tags,
    {
      "Name" = "${var.environment}-public-subnet-${element(keys(var.public_subnets), count.index)}"
    }
  )
}

resource "aws_subnet" "eks_private_subnets" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = element(values(var.private_subnets), count.index)
  availability_zone = element(keys(var.private_subnets), count.index)

  tags = merge(
    var.priv_sub_tags,
    local.subnet_common_tags,
    {
      "Name" = "${var.environment}-private-subnet-${element(keys(var.private_subnets), count.index)}"
    }
  )
}