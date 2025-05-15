variable "ec2-instance-type" {
	default = "t2.micro"
	type = string
}

variable "ec2-root-storage-size" {
	default = 10
	type = number
}

variable "ec2-ami-id" {
	default = "ami-0e35ddab05955cf57"
	type = string
}


