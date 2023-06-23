resource "aws_db_parameter_group" "default" {
  name   = "${var.COMPONENT}-${var.ENV}-pg"
  family = "${var.ENGINE}${var.ENGINE_VERSION}"
}
