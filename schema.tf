resource "null_resource" "schema-load" {
  provisioner "local-exec" {
    command = <<EOT
    curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
cd /tmp
unzip /tmp/mysql.zip
cd mysql-main
mysql -h ${aws_db_instance.default.address} -u${jsondecode(data.aws_secretsmanager_secret_version.roboshop.secret_string)["RDS_USERNAME"]} -p${jsondecode(data.aws_secretsmanager_secret_version.roboshop.secret_string)["RDS_PASSWORD"]} <shipping.sql
EOT
  }
}