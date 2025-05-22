We need to secure **.tfstate** file but we can't commit it on github so we will store it on aws-s3 bucket and **update state** from s3 bucket.

**create provider by providers.tf**
<pre><code>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
</code></pre>

**create s3 bucket by s3.tf**
<pre><code>
resource "aws_s3_bucket" "s31" {
  bucket = "xcxvsdfdsfcvbcgdfgcc"

}
</code></pre>

**create dynamodb by dynamodb.tf**
<pre><code>
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "tws-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
 
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "tws-table"
  }
}
</code></pre>

**after created s3 and dynamodb we will update providers.tf**
<pre><code>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }


 backend "s3" {
	bucket = "xcxvsdfdsfcvbcgdfgcc"
	key = "terraform.tfstate"
	dynamodb_table = "tws-table"
	region = "ap-south-1"
 }

}
</code></pre>

now if by mistake we delete .tfstate file or .tfstate.backup file, after that we can check state because our data store in s3.
<pre><code>terraform state list</code></pre>

 
