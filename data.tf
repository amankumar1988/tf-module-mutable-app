data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "b53-tfstate-bucket-1"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
    }
  }


data "terraform_remote_state" "alb" {
  backend = "s3"

  config = {
    bucket = "b53-tfstate-bucket-1"
    key    = "alb/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
    }
  }

# Fetch information of LAB AMI
data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "LAB-Ami-With-Ansible-Installed"
  owners           = ["self"]

}

