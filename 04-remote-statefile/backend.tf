terraform {
  backend "s3" {
    bucket = "1pk"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "web" {
    ami = "ami-066f46167f3ce8bfe"
    instance_type = "t3.micro"
}