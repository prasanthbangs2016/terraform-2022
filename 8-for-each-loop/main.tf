resource "aws_instance" "web" {
    #loop from variable loop to create 2 instances
    for_each = var.sample
    ami = "ami-066f46167f3ce8bfe"
    instance_type = "t3.micro"

    tags = {
        Name = each.key
    }
 

  
}

variable "sample" {
    default = ["one", "two"]
  
}