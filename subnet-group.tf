resource "aws_db_subnet_group" "default" {
  name       = "${var.ENV}"
  subnet_ids = var.SUBNET_IDS

  tags = {
    Name = "${var.ENV}-${var.COMPONENT}"
  }
}