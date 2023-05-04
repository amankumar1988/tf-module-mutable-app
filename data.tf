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
data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "LAB-Ami-With-Ansible-Installed"
  owners           = ["self"]

}

# Fetches the secret from secret Manager

data "aws_secretsmanager_secret" "secrets" {
  name = "roboshop/secrets"
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id     = data.aws_secretsmanager_secret.secrets.id
}
