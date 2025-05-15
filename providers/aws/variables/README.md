# Variables

A variable is like a box where you can store a value (like a number or word) and give it a name so you can use it later in a program.

**variables.tf**
<pre><code>
# we can define variables here
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
</code></pre>

we can use it in other terraform files like
<pre><code>
var.ec2-instance-type
var.ec2-root-storage-size
var.ec2-ami-id
</code></pre>

**aws-ec2.tf**
<pre><code>
#create key pair
resource aws_key_pair my_key{
  key_name   = "aws-terraform.pub"
  public_key = file("/root/Terraform/providers/aws/variables/aws-terraform.pub")
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
	key_name = aws_key_pair.my_key.key_name
	#security_groups = [aws_security_group.my_security_group.name]
	vpc_security_group_ids = [aws_security_group.my_security_group.id]
	subnet_id = "subnet-07fc330a10e5cae59"
	ami = var.ec2-ami-id
	instance_type = var.ec2-instance-type

	# machine root volume size defines here
	root_block_device {
		volume_size = var.ec2-root-storage-size
		volume_type = "gp3"
		
	}
	tags = {
		Name = "terraform"
	}

}
</code></pre>

# output

outputs.tf
<pre><code>
output "ec2_public_ip"{
	value = aws_instance.ec2-instance.public_ip
}

output "ec2_public_dns" {
	value = aws_instance.ec2-instance.public_dns
}

output "ec2_private_ip" {
        value = aws_instance.ec2-instance.private_ip
}
</code></pre>
