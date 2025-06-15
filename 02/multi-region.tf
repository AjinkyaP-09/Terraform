provider "aws" {
  alias = "region_1"
  region = "ap-south-1"
}

provider "aws" {
  alias = "region_2"
  region = "us-east-1"
}

resource "aws_instance" "instance-1"{
  ami = "ami-0b09627181c8d5778"
  instance_type = "t2.micro"
  provider = aws.region_1
  key_name = "demo"
  tags = {
    Name = "Instance-in-AP"
  }
}

resource "aws_instance" "instance-2"{
  ami = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
  provider = aws.region_2
  key_name = "demo"
  tags = {
    Name = "Instance-in-US"
  }
}
