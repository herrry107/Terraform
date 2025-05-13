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

if we want to create script with specific providers
<pre><code>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.97.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.28.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "azurerm" {
  # Configuration options
}
</code></pre>

