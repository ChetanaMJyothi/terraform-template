terraform {
  required_version = ">=0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.5.0"
    }
  }
  backend "s3" {
    bucket         = "backend-store-s3-1223"
    region         = "ap-south-1"
    key            = "terraform/ec2/terraform.tfstate"
    dynamodb_table = "dynamodb-backend"
    encrypt        = true
  }
}

