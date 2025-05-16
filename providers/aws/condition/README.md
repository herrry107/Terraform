# condition

In Terraform, a condition is typically used in expressions to perform logic like ternary operations, count, for_each, or conditional resource arguments. This allows you to dynamically control values or whether something should be created/applied based on some logic.

<pre><code>condition ? true_value : false_value</code></pre>
<pre><code>
root_block_device {
        volume_size = var.env == "prd" ? 20 : var.ec2-root-storage-size
        volume_type = "gp3"
}
</code></pre>

aws-ec2.tf
<pre><code>
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
                volume_size = var.env == "prd" ? 20 : var.ec2-root-storage-size
                volume_type = "gp3"

        }
        tags = {
                Name = "terraform"
        }

}
</code></pre>

