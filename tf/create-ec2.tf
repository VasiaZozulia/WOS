provider "aws" {
  region     = "eu-north-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "terraform_instance" {
  count                  = 1
  ami                    = "ami-0ed17ff3d78e74700"
  instance_type          = "t3.micro"
  key_name               = "stockholm"
  vpc_security_group_ids = [aws_security_group.Web.id]
  tags = {
    Name = "Powered by terraform"

  }
}

resource "aws_security_group" "Web" {
  name        = "Web"
  description = "My SG"
  ingress {
    description = "Allow 80"
    protocol    = "tcp"
    to_port     = 80
    from_port   = 80
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "Allow 443"
    protocol    = "tcp"
    to_port     = 443
    from_port   = 443
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "Allow 22"
    protocol    = "tcp"
    to_port     = 22
    from_port   = 22
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "Allow 8080"
    protocol    = "tcp"
    to_port     = 8080
    from_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
