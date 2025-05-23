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
