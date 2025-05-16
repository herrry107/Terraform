# aws-cli install

currently we don't have aws provider installed, we can install it by init command
<pre><code>terraform init</code></pre>

**install aws-cli**

install by official aws url

[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

install by command in linux
<pre><code>
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
</code></pre>

# aws-cli configure

configure aws-cli
<pre><code>aws configure</code></pre>

show all s3 bucket in aws
<pre><code>aws s3 ls</code></pre>

**Resources Create in AWS**
- [1. Create s3 bucket](https://github.com/herrry107/Terraform/tree/main/providers/aws/s3)
- [2. Create ec2 instance](https://github.com/herrry107/Terraform/tree/main/providers/aws/ec2)
- [3. define variables](https://github.com/herrry107/Terraform/tree/main/providers/aws/variables)
- [4. output data](https://github.com/herrry107/Terraform/tree/main/providers/aws/outputs)
- [5. shell script](https://github.com/herrry107/Terraform/tree/main/providers/aws/shell-script)
- [6. loops](https://github.com/herrry107/Terraform/tree/main/providers/aws/loops)
- [7. depends_on](https://github.com/herrry107/Terraform/tree/main/providers/aws/depends_on)
- [8. condition](https://github.com/herrry107/Terraform/tree/main/providers/aws/condition)


