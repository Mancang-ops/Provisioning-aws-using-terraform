output "ns-servers" {
  value = aws_route53_zone.rudiyanto.name_servers
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}
