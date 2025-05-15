# Shell Script

if we want to run shell script while creating ec2-instance 

install_nginx.sh
<pre><code>
#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>HELLO TERRAFORM</h1>" > /var/www/html/index.html
</code></pre>

now we need to attach this script with ec2 instance so in ec2 block we need to add
<pre><code>user_data = file("install_nginx.sh")</code></pre>

<pre><code>
# ec2-instance

resource aws_instance ec2-instance{
        key_name = aws_key_pair.my_key.key_name
        #security_groups = [aws_security_group.my_security_group.name]
        vpc_security_group_ids = [aws_security_group.my_security_group.id]
        subnet_id = "subnet-07fc330a10e5cae59"
        ami = var.ec2-ami-id
        instance_type = var.ec2-instance-type
        associate_public_ip_address = true
        user_data = file("install_nginx.sh")

        # machine root volume size defines here
        root_block_device {
                volume_size = var.ec2-root-storage-size
                volume_type = "gp3"

        }
        tags = {
                Name = "terraform"
        }

}
</code></pre>

