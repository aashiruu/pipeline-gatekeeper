terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Deliberately non-compliant S3 bucket for policy gating tests
resource "aws_s3_bucket" "app_data" {
  bucket = "pipeline-gatekeeper-demo-bucket-12345"
}

resource "aws_s3_bucket_public_access_block" "app_data_public" {
  bucket = aws_s3_bucket.app_data.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
