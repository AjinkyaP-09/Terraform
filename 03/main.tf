provider "aws" {
    region = "ap-south-1"
}

module "security_group"{
	source = ".//sg"
}

module "ec2_instance"{
	source = ".//ec2_instance"
	security_group_ids   = [module.security_group.security_group_id]
	instance_type = "t2.micro"
}


output "public_ip"{
	value = "aws_instance.myinstance.id"
#	security_group_ids   = [module.security_group.security_group_id]
}
