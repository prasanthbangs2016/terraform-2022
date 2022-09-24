resource "aws_instance" "web" {
    ami = "ami-066f46167f3ce8bfe"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web.id]

    tags = {
      "Name" = "web"
    }


  
}