terraform {
  backend "s3" {
    bucket = "1pk"
    key    = "terraform/modules/terraform.tfstate"
    region = "us-east-1"
  }
}
