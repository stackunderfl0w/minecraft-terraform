terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Allow inbound traffic on port 25565 and SSH on port 22"

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "minecraft-terra" {
  # Ubuntu 22.04 LTS
  ami     = "ami-01cd4de4363ab6ee8"
  
  instance_type = "t3.small"

  key_name = "ssh"

  tags = {
    Name = "minecraft-terra"
  }

  # Network settings
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]
}