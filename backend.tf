terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-100aw"
    key            = "lambda-sqs-sns/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}