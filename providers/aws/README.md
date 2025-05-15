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

- [1. Create s3 bucket]()
- [2. Create ec2 instance]()
- [3. define variables]()

