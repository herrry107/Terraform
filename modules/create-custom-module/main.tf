module "dev-infra"{
	source = "./terraform-modules-app"
	ec2-instance-type = "t2.micro" 
	s3_name = "dev" 
	env = "dev"	
}

module "prd-infra"{
        source = "./terraform-modules-app"
        ec2-instance-type = "t2.small"
        s3_name = "prd"
        env = "prd"
}

