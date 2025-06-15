variable "ami_id" {
  type = string
  description = "AMI Id for intance image"
  default = "ami-0b09627181c8d5778"
}

variable "key" {
  default = "demo"
}

variable "i_type" {
  default = "t2.micro"
}
