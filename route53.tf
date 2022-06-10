resource "aws_eip" "lb" {
  instance = aws_instance.rudi-test.id
  vpc      = true
}

resource "aws_route53_zone" "rudiyanto" {
  name = "rudiyanto.my.id"
}

resource "aws_route53_record" "rudiyanto-my-id" {
  zone_id = aws_route53_zone.rudiyanto.zone_id
  name    = "rudiyanto.my.id"
  type    = "A"
  ttl     = "300"
  records = ["${aws_eip.lb.public_ip}"]
}




