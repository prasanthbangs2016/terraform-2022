terraform {
  backend "s3" {
    bucket = "1pk"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}