# create own modules

firstly we will create provider.tf file
<pre><code>
provider "aws"{
	region = "ap-south-1"
}
</code></pre>

now we will create terraform.tf file
<pre><code>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}
</code></pre>

now we will create main.tf file
<pre><code>
#module for dev infrastructre
module "dev-infra"{
	source = "./terraform-modules-app"
	ec2-instance-type = "t2.micro" 
	s3_name = "dev" 
	env = "dev"	
}

#module for production infrastructure
module "prd-infra"{
        source = "./terraform-modules-app"
        ec2-instance-type = "t2.small"
        s3_name = "prd"
        env = "prd"
}
</code></pre>

**now we will create /terraform-modules-app directory**
<pre><code>mkdir terraform-modules-app</code></pre>

now create aws-ec2.tf file
<pre><code>
#create key pair
resource aws_key_pair my_key{
  key_name   = "${var.env}aws-terraform.pub"
  public_key = file("/root/Terraform/modules/create-custom-module/aws-terraform.pub")
}

#VPC
resource aws_default_vpc default {
  tags = {
    Name = "Default VPC"
  }
}

#Security Group
resource aws_security_group my_security_group{
	name = "${var.env}-automate-sg"
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
	associate_public_ip_address = true
	# machine root volume size defines here
	root_block_device {
		volume_size = var.ec2-root-storage-size
		volume_type = "gp3"
		
	}
	tags = {
		Name = "terraform"
		Environment = "${var.env}"
	}

}
</code></pre>

now create aws-s3.tf file
<pre><code>
# this is s3 bucket

resource aws_s3_bucket my_bucket {
	bucket = "${var.s3_name}terraform-practice-23432wersdf"
}
</code></pre>

now create variables.tf file
<pre><code>
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
</code></pre>

**after complete all files run commands**
<pre><code>
terraform init
terraform plan
terraform apply
</code></pre>


