resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "terraform-demo"
    env  = var.env
    name = "shubham"
  }
}
