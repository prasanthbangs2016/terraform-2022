resource "aws_instance" "web" {
    count = 2
    ami = "ami-066f46167f3ce8bfe"
    instance_type = "t3.micro"
 

  
}