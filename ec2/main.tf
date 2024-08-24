data "aws_ami" "aws_ami" {
  most_recent = true
  owners      = ["amazon"] # Specify the owner (e.g., "amazon" for official AMIs)
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"] //new ami 
    #values = ["amzn2-ami-hvm-*"]  # Replace with the desired AMI name
  }
  // adding additional filter
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance" {
  ami                    = data.aws_ami.aws_ami.id
  instance_type          = var.instance_type

  security_groups = [aws_security_group.security_group.id]
     

  tags = {
    Name = "My-Server"
  }

}

resource "aws_security_group" "security_group" {
  name   = "security_group"

  tags = {
    Name = "My-Server-sg"
  }

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = var.protocol #"tcp"
    cidr_blocks = var.cidr_blocks #["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}