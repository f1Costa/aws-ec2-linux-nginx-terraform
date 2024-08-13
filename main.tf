# Especifica o provedor da AWS
provider "aws" {
  region = "us-east-1"
}

# Define o security group para permitir tráfego HTTP e SSH
resource "aws_security_group" "instance_sg" {
  name        = "terraform-instance-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
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

  tags = {
    Name = "terraform-instance-sg"
  }
}

# Cria a instância EC2
resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI para us-east-1
  instance_type = "t3.micro"
  security_groups = [aws_security_group.instance_sg.name]

  # Script para instalar Nginx na inicialização
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
            EOF

  tags = {
    Name = "Terraform-Example-Instance"
  }
}
