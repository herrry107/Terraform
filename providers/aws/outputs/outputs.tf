output "ec2_public_ip"{
	value = aws_instance.ec2-instance.ip
}

output "ec2_public_dns" {
	value = aws_instance.ec2-instance.dns
}

output "ec2_private_ip" {
        value = aws_instance.ec2-instance.private_ip
}

