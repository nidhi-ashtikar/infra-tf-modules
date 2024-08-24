variable "instance_type" {
  type    = string
  default = "t2.micro"
}
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