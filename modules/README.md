# modules

In Terraform, modules are a fundamental feature that allows you to organize and reuse code efficiently. They enable you to group related resources together and call them multiple times throughout your configuration, making your infrastructure as code (IaC) more maintainable, scalable, and modular.

module script for creating vpc
<pre><code>
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc1"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a","ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "prd"
  }
}
</code></pre>

module script for creating ec2-instance
<pre><code>
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "ubuntu"
  monitoring             = true
  vpc_security_group_ids = ["sg-0be2b7f825f7be2a4"]
  subnet_id              = "subnet-07fc330a10e5cae59"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
</code></pre>

