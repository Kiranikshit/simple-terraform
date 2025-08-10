terraform {
  backend "s3" {
    bucket         = "terraform-kiran-s3-backend-s3-demo-bucket"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}