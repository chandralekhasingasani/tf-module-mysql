resource "aws_db_instance" "default" {
  allocated_storage    = 10
  identifier           = "${var.COMPONENT}-${var.ENV}-mysql"
  db_name              = "mydb"
  engine               = var.ENGINE
  engine_version       = var.ENGINE_VERSION
  instance_class       = var.INSTANCE_CLASS
  username             = jsondecode(data.aws_secretsmanager_secret_version.roboshop.secret_string)["RDS_USERNAME"]
  password             = jsondecode(data.aws_secretsmanager_secret_version.roboshop.secret_string)["RDS_PASSWORD"]
  parameter_group_name = aws_db_parameter_group.default.name
  skip_final_snapshot  = true
}

data "aws_secretsmanager_secret" "roboshop" {
  arn = "arn:aws:secretsmanager:us-east-1:697140473466:secret:roboshop-3wTSpx"
}

data "aws_secretsmanager_secret_version" "roboshop" {
  secret_id = data.aws_secretsmanager_secret.roboshop.id
}
