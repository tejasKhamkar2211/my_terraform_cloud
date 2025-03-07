terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      version = "~>3.1"
    }
  }
}
variable "access_key" { }
variable "secrete_key" { }
provider "aws"{
  region = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "my_ec2"  {
  ami           = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0f8e06a916abb2b98"]
  tags = {
    Name = "terraform_cloud_instance"
  }

}
