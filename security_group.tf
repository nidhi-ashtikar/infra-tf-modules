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