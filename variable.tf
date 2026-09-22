variable "ami" {
  description = "Ubuntu 26.04 LTS AMI ID"
  default     = "ami-091138d0f0d41ff90"
}
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}
variable "key_name" {
  description = "Existing key pair name"
  default     = "shub"
}
variable "security_group" {
  description = "Security group ID"
  default     = "sg-0694a98958c72f52d"
}
variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}
variable "env" {
  description = "Environment tag"
  default     = "dev"
}
