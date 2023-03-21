terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "bj-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bb" {
  bucket = "bj-test-bucket2"

  tags = {
    Name        = "My bucket 2"
    Environment = "Dev"
  }
}

variable "subject" {
   type = string
   default = "World"
   description = "Subject to hello"
}

output "hello_world" {
  value = "Hello, ${var.subject}! Cool Beans"
}
