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