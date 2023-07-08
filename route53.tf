resource "aws_route53_record" "component" {
  zone_id = var.PRIVATE_HOSTED_ZONE_ID
  name    = "mysql-${var.ENV}.roboshop.internal"
  type    = "CNAME"
  ttl     = 300
  records = [aws_db_instance.default.address]
}