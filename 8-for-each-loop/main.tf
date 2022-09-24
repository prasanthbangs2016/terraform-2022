resource "aws_instance" "web" {
    #loop from variable loop to create 2 instances and converting toset
    for_each = toset(var.sample)
    ami = "ami-066f46167f3ce8bfe"
    instance_type = "t3.micro"

    tags = {
        Name = each.key
    }
 

  
}

variable "sample" {
    default = ["one", "two"]
  
}