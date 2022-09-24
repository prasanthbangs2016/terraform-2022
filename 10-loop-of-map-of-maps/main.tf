resource "aws_instance" "web" {
    #loop from variable to create 2 instances using map
    for_each = var.sample
    ami = "ami-066f46167f3ce8bfe"
    #accessing variable values from map using value
    instance_type = each.value

    tags = {
        #accessing values
        Name = each.key
    }
 

  
}

variable "sample" {
    default = {
        one = "t3.micro"
        two = "t3.medium"

    }
  
}