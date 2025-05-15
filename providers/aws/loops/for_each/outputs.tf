output "ec2_public_ip"{
	value = [
	for key in aws_instance.ec2-instance : key.public_ip
	]
}

output "ec2_public_dns" {
	value = [
        for key in aws_instance.ec2-instance : key.public_dns
        ]

}

output "ec2_private_ip" {
	value = [
        for key in aws_instance.ec2-instance : key.private_ip
        ]

}

