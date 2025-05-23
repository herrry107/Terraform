variable "ec2-instance-type" {
	description = "instance type "
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

variable "s3_name" {
        description = "s3 bucket name"
        type = string
}
  
variable "env" {
        description = "environment name"
        type = string
}
 
