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
