# depends_on

In Terraform, depends_on is a meta-argument used to explicitly declare resource dependencies. It ensures that one resource is created only after another specific resource (or resources) has been created or completed.

Normally, Terraform automatically infers dependencies based on references between resources. However, sometimes you need to define them manually, especially when the dependency isn't obvious from the code.

**aws-ec2.tf**
<pre><code>
# ec2-instance

resource aws_instance ec2-instance{

        # depends on other resources creation
        depends_on = [aws_key_pair.my_key,aws_security_group.my_security_group]

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


