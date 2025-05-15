#create key pair
resource aws_key_pair my_key{
  key_name   = "aws-terraform.pub"
  public_key = file("/root/Terraform/providers/aws/loops/aws-terraform.pub")
}

#VPC
resource aws_default_vpc default {
  tags = {
    Name = "Default VPC"
  }
}

#Security Group
resource aws_security_group my_security_group{
	name = "automate-sg"
	description = "this will add a TF generated security group"
	vpc_id = aws_default_vpc.default.id  #interpolation
	
	#tags - optional
	tags = {
		Name = "automate-sg"
	}	

	#inbound rules
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]	# access from IP
		description = "SSH open"
	
	}	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
		description = "HTTP open"
	}

	#outbound rules
	egress {
		from_port = 0 	# 0 means all
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
		description = "all"

	}
}

# ec2-instance

resource aws_instance ec2-instance{
	count = 2	#total number of instance
	key_name = aws_key_pair.my_key.key_name
	#security_groups = [aws_security_group.my_security_group.name]
	vpc_security_group_ids = [aws_security_group.my_security_group.id]
	subnet_id = "subnet-07fc330a10e5cae59"
	ami = "ami-0e35ddab05955cf57"
	instance_type = "t2.micro"
	associate_public_ip_address = true

	# machine root volume size defines here
	root_block_device {
		volume_size = 10
		volume_type = "gp3"
		
	}
	tags = {
		Name = "terraform"
	}

}


