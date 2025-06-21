variable "ami_id" {
	default = "ami-0f918f7e67a3323f0"
}
variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance."
  type        = list(string)
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  type        = string
}
