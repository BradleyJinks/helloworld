terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "c" {
  bucket = "bj-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "bucket_arn" {
  value = aws_s3_bucket.c.arn
}