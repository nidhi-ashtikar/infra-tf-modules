variable "instance_type" {}
variable "port" {}
variable "protocol" {}
variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
}