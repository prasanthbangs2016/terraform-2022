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
#this is basic key and value variable
variable "sample" {
  default = "Welcome to Terraform Leaning Prashanth"
}

#Referring a variable
output "sample" {
  value = "var.sample"
}

3-variable datatypes

#1-strings
#2-numbers
#3-boolean

strings should be quoted in double quotes
numbers and booleans need not to be.

note : "terraform supports only double quotes,not single quotes"

#string datatype
variable "sample1" {
  default = "Hello"
}

#number data type

variable "sample2" {
  default = 100
}


#boolean data type

variable "sample2" {
  default = true
}

4-variable types
#list: key will have multiple values
variable "sample" {
  default = [
    "hello",
	1000,
	true,
	"world"
	]
}

#Map: key will have multiple values
variable "sample" {
  default = {
    string = "hello",
	number = 1000,
	boolean = true
  }
# terraform supports different data types in a single list or map variable,need not to be the same datatype

# variable inputs
#u declare an variable how do u send value to the terraform

default = "Input"
.tfvars ---> terraform
Terraform cli ---> variable "sample" {}
shell environment variables -->export

#if you write a file called terraform.tfvars
#vars.tf
variable "test" {}

output "test" {
  value = "var.test"
}

variable "test1" {}

output "test1" {
  value = "var.test1"
}

#terraform.tfvars
test = 100

#terraform.auto.tfvars
test1 = 100

#these 2 files automatically terraform picks up

#manually telling to terraform variable values
terraform apply -auto-approve -var-file dev.tfvars

#precedence of variables
#high priority ---(top to down)-----------------#low priority
-var (commandline
-var-file (commnad line)
*auto.tfvars (automatic)
terraform.tfvars (automatic)
SHELL
ENV
VARS

if variable value terraform didnt find then it will ask for the value
 

#provider
terraform has multiple providers ex: aws,azure,gcp,github etc
every provider has version 
if provider version not provided it will take latest version
