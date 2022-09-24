# terraform-2022

learning-terraform
-> In terraform all the blocks should be named.

-> Every block is going to have keys and values

Blocks
1. Output Block
-> Output will be used to print the message on screen -> Output also will be used to share the data between modules.

2-variables
#empty variable,value will be provided when u running the code(Parameterization,input from user)
variable "sample" {}

#variable with data
variable "sample" {
  default = "Welcome to Terraform Leaning Prashanth"
}

#Referring a variable
output "sample" {
  value = "var.sample"
}


