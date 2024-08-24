

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

  security_groups = [ aws_security_group.security_group.id ]
  
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "Hello from Instance" > /var/www/html/index.html

EOF   

  tags = {
    Name = "My-Server"
  }

}



