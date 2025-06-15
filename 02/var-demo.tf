variable "region"{
  description = "Region for resource"
  type = string
  default = "ap-south-1"
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "var_demo" {
  ami = var.ami_id
  instance_type = var.i_type
  key_name = var.key
}

output "public_ip" {
  description = "public IP of instance"
  value = aws_instance.var_demo.public_ip
}
