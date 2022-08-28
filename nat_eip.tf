resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    "Name" = "${var.environment}-nat-eip"
  }
}