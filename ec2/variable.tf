

variable "port" {
  type    = number
  default = 22
}
variable "protocol" {
  type    = string
  default = "tcp"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
  
}

variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default = "t2.micro"
}

# variable "region" {
  
# }