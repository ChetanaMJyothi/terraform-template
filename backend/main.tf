provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "Terr-s3" {
  bucket        = "backend-store-s3-1223"
  force_destroy = true

  tags = {
    Name = "My-bucket"
  }
}

resource "aws_s3_bucket_versioning" "Terr-s3-versioning" {
  bucket = aws_s3_bucket.Terr-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "Terr-dynamodb" {
  name           = "dynamodb-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "backend-dynamodb-table"
    Environment = "production"
  }
}
