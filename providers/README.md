# Providers

In Terraform, a provider is a plugin that allows Terraform to interact with external APIs and services. Providers are responsible for defining and managing the resources from a specific service (like AWS, Azure, Google Cloud, GitHub, Kubernetes, etc.).

**aws-s3.tf**
<pre><code>
# this is s3 bucket

resource aws_s3_bucket my_bucket {
	bucket = "terraform-practice-23432wersdf"
}
</code></pre>

currently we don't have aws provider installed, we can install it by init command
<pre><code>terraform init</code></pre>


