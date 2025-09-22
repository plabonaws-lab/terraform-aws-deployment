provider "aws" {
  region = "ap-southeast-1"   # change to your region
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "plabon-terraform-demo-bucket-123"   # must be globally unique
  acl    = "private"

  tags = {
    Name        = "DemoBucket"
    Environment = "Dev"
  }
}
