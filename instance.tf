resource "aws_instance" "rudi-test" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.public-subnet-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # the public SSH key
  key_name = aws_key_pair.rudi-keypair.key_name
  
  # Provisioner copy file to cloud
  
  
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-test.id
  instance_id = aws_instance.rudi-test.id

  provisioner "file" {
    source      = "~/create-vpc-using-terraform/vpc-test/script.sh"
    destination = "/home/ubuntu/script.sh"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${aws_instance.rudi-test.public_ip}"
    }
  }

  provisioner "remote-exec" {
    inline = [
        "chmod 755 ~/script.sh",
        "sh ~/script.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${aws_instance.rudi-test.public_ip}"
    }
  }

}
