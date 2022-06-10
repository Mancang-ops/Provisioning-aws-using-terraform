resource "aws_ebs_volume" "ebs-test" {
  availability_zone = "ap-southeast-1a"
  size              = 50
  type              = "gp2"
  tags = {
    Name = "EBS-test"
  }
}

