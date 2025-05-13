# aws

**aws-s3.tf**
<pre><code>
# this is s3 bucket

resource aws_s3_bucket my_bucket {
    bucket = "terraform-practice-23432wersdf"
}
</code></pre>

currently we don't have aws provider installed, we can install it by init command
<pre><code>terraform init</code></pre>

# aws-cli

**install aws-cli**

install by official aws url

[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

install by command in linux
<pre><code>
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
</code></pre>
