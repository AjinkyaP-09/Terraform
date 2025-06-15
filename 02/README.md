# 1. multi-region resource creation
 - Create two provider blocks with respective aliases.

![image](https://github.com/user-attachments/assets/b45178b4-b9d7-4e34-a5e7-bc7b42440901)

 - Use the provider blocks in the resource block as below:

![image](https://github.com/user-attachments/assets/e6ae9787-fe7f-4d2d-ab1b-359b80e33f5a)

 - Use terraform apply and launch the instances.
 - We can see the instances in 2 different regions:
![image](https://github.com/user-attachments/assets/1530fb14-e40e-4ba9-9652-4409f4bfba91)
![image](https://github.com/user-attachments/assets/e77165c3-1aad-4d60-9404-64200d000ecf)

# 2. variables use
 - Create a .tf file to use variables in it I have used a variable declared in it and als omentioned in variables.tf. i have also declared output variable that will provide public IP of instance created.
 - nano var-demo.tf
```
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
 ```
 - nano variables.tf
```
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
```
 - Run ``` terraform apply --auto-approve ``` and see the output on terminal as:
```
    Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public_ip = (known after apply)
aws_instance.var_demo: Creating...
aws_instance.var_demo: Still creating... [00m10s elapsed]
aws_instance.var_demo: Creation complete after 16s [id=i-054792290ae838076]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

public_ip = "3.110.115.184"
```
 - Can check in the AWS console.
 -  ![image](https://github.com/user-attachments/assets/97ec7c39-e080-4b97-81f1-129a82db9ddc)
 - Destroy resources using ``` terraform destroy --auto-approve ```.
