resource "aws_instance" "web" {
    #loop from variable to create 2 instances using map
    for_each = var.sample
    ami = "ami-066f46167f3ce8bfe"
    #accessing variable values from map using with iteration
    instance_type = each.value["type"]

    tags = {
        #accessing values with iteration

        Name = each.value["name"]
    }
 

  
}

variable "sample" {
    default = {
        one = {
            type = "t3.micro"
            name = "one"
        }

        two = {
            type = "t3.medium"
            name = "two"

        }

    }
  
}