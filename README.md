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

#modules : like functions (reusable)
you cannot share the data from one module to other module,this can be done using root module

#loops
count : this is the keyword for loop
this is normal loop (count =2) accessing ${count.index}

foreach: 

for_each argument whose value is a map or a set of strings

Version note: for_each was added in Terraform 0.12.6.
Module support for for_each was added in Terraform 0.13;
previous versions can only use it with resources.

to set
======
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

map
===
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

map of map(important-realtime use case)
========================================
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

#condition
=========
resource "aws_instance" "web" {
    ami = "ami-066f46167f3ce8bfe"
    #if any value is not given(default value is null),then pickup t3.micro,if not null pickup 
    #value given by user
    instance_type = var.instance_type == null ? "t3.micro" : var.instance_type
	#below is the syntax
	#instance_type = var.instance_type == condition ? true_val : false
    
  
}

variable "instance_type" {
    default = null
  
}


#terraform plan -var instance_type="t3.medium"
#terraform apply -var instance_type="t3.medium"


#functions
===========
convert to upper case
cut a string
add some number

functions can be used with arguments in resource and modules also.

terraform console

> lower("HELLO")
"hello"

> max(5, 12, 9)
12

#provisioners
===============
are used to execute certain tasks after the resource creation
ex: connect to instance and perform/execute commands on that instance/copy somefile

provsioner is always sub block of resource

we can make multiple provisioners and provisioner types in the same resource

https://www.terraform.io/language/resources/provisioners/syntax

#File Provisioner:
The file provisioner copies files or directories from the machine running Terraform to the newly created resource.

The file provisioner supports both ssh and winrm type connections.

#local-exec Provisioner

#remote-exec Provisioner
The remote-exec provisioner invokes a script on a remote resource after it is created.
The remote-exec provisioner requires a connection and supports both ssh and winrm
This can be used to run a configuration management tool,
bootstrap into a cluster, etc. To invoke a local process,
see the local-exec provisioner instead.
#example
resource "aws_instance" "web" {
  ami                    = "ami-066f46167f3ce8bfe"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a660dbc66353e4f6"]

  #specified connection details

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user   = "root"
      password = "DevOps321"
    }
    #inline is list of commands
    inline = [
      "echo Hey Buddy",
      "echo Welcome Terraform Learning 2022"
      
    ]
  }

}
#output from terraform apply

aws_instance.web (remote-exec): Connected!
aws_instance.web (remote-exec): Hey Buddy
aws_instance.web (remote-exec): Welcome Terraform Learning 2022

#null resource : it is resource to execute commands using provisioners
#best practice to use this
resource "aws_instance" "web" {
  ami                    = "ami-066f46167f3ce8bfe"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a660dbc66353e4f6"]
  
}

resource "null_resource" "cli" {

    provisioner "remote-exec" {
    connection {
      host = aws_instance.web.public_ip
      user   = "root"
      password = "DevOps321"
    }
    #inline is list of commands
    inline = [
      "echo Hey Buddy",
      "echo Welcome Terraform Learning 2022"
      
    ]
  }


}







