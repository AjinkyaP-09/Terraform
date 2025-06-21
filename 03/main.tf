provider "aws" {
    region = "ap-south-1"
}

module "security_group"{
	source = ".//sg"
}

module "ec2_instance"{
	source = ".//ec2_instance"
}

output "public_ip"{
	value = "aws_instance.myinstance.id"
}
