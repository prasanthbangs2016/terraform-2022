resource "aws_instance" "web" {
    ami = "ami-066f46167f3ce8bfe"
    #if any value is not given(default value is null),then pickup t3.micro,if not null pickup 
    #value given by user
    instance_type = var.instance_type == null ? "t3.micro" : var.instance_type
    
  
}

variable "instance_type" {
    default = null
  
}


#terraform plan -var instance_type="t3.medium"
#terraform apply -var instance_type="t3.medium"
