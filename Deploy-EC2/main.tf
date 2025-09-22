terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "plabon-terraform-state"      # your S3 bucket for remote state
    key            = "Deploy-EC2/terraform.tfstate" # path inside the bucket
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock"               # optional, recommended for locking
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

# S3 bucket resource
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "plabon-terraform-demo-bucket-123" # must be globally unique

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}

# If you want ACL to work properly, use aws_s3_bucket_acl resource instead of deprecated `acl` argument
resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "private"
}

