resource "aws_instance" "web" {
    ami = "ami-066f46167f3ce8bfe"
    instance_type = "t3.micro"
}

    tags = {
      "Name" = "web"
    }


  