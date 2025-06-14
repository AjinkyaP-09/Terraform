provider "aws"{
  region = "ap-south-1"
}

resource "aws_instance" "Terra-Instance-1" {
  ami = "ami-02521d90e7410d9f0"
  subnet_id = "subnet-05937d3cbd349f76b"
  key_name = "demo"
  instance_type = "t2.micro"
}
