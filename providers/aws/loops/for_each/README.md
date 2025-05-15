# for_each

In Terraform, for_each is a meta-argument that allows you to create multiple instances of a resource or module based on the elements in a map or set of strings.

It provides more control and flexibility than count, especially when dealing with named resources (e.g., when you want each instance to have a unique identifier).

**ec2-for_each.tf**
<pre><code>
# ec2-instance

resource aws_instance ec2-instance{
        for_each = tomap({
        instance1 = "t2.micro"
        instance2 = "t2.medium"
})      # meta arguments


        key_name = aws_key_pair.my_key.key_name
        #security_groups = [aws_security_group.my_security_group.name]
        vpc_security_group_ids = [aws_security_group.my_security_group.id]
        subnet_id = "subnet-07fc330a10e5cae59"
        ami = "ami-0e35ddab05955cf57"
        instance_type = each.value
        associate_public_ip_address = true

        # machine root volume size defines here
        root_block_device {
                volume_size = 10
                volume_type = "gp3"

        }
        tags = {
                Name = each.key
        }

}
</code></pre>

**outputs.tf**
<pre><code>

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
</code></pre>


