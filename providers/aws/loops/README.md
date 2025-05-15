# count

In Terraform, count is a meta-argument that allows you to manage multiple instances of a resource using a single block of code. It determines how many copies of a resource (or module) should be created.

<pre><code>count = 2</code></pre>

**aws-ec2.tf**
<pre><code>
# ec2-instance

resource aws_instance ec2-instance{
        count = 2       #total number of instance
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
</code></pre>

**outputs.tf** for multiple list of output
<pre><code>
# ec2 instance outputs
output "ec2_public_ip"{
	value = aws_instance.ec2-instance[*].public_ip
}

output "ec2_public_dns" {
	value = aws_instance.ec2-instance[*].public_dns
}

output "ec2_private_ip" {
        value = aws_instance.ec2-instance[*].private_ip
}
</code></pre>
