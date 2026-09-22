variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
locals {
  public_subnet_cidr = "10.0.1.0/24"
}
locals {
  private_subnet_cidr = "10.0.2.0/24"
  
}
variable "ami" {
  default = "ami-0c94855ba95c71c99"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "shub"
}
variable "vpc_security_group_ids" {
  default = ["sg-0694a98958c72f52d"]
}
variable "instance_name" {
  default = "my-ec2-instance"
}