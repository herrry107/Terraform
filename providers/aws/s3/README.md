# aws s3

**aws-s3.tf**
<pre><code>
# this is s3 bucket
resource aws_s3_bucket my_bucket {
    bucket = "terraform-practice-23432wersdf"
}
</code></pre>

**aws-provider-config.tf**
<pre><code>
#this file is optional otherwise resource create in default region
provider "aws"{
    region = "us-east-2"
}
</code></pre>

validate syntax
<pre><code>terraform validate</code></pre>

apply files
<pre><code>terraform apply</code></pre>

if we want to delete terraform created resource
<pre><code>terraform destroy</code></pre>


