resource "aws_instance" "tf_ec2" {
  ami = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
#   key_name  = "tf-key"
  subnet_id = aws_subnet.privsub_1.id
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id]
  availability_zone      = "us-east-1a"
#   user_data              = file("apache-install.sh")
  # tags                   = var.ec2_instance_tags

  tags = {
    Name = "mahmuda-private-EC2"
  }

}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "cidr" {
  default = "172.16.0.0/20"
}
