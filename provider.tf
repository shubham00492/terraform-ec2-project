terraform {
  backend "s3" {
    bucket = "terraform-shubham"
    key    = "vpc.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}

