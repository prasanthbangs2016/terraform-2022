# #
# resource "aws_instance" "web" {
#   ami                    = "ami-066f46167f3ce8bfe"
#   instance_type          = "t3.micro"
#   vpc_security_group_ids = ["sg-0a660dbc66353e4f6"]

#   #specified connection details

#   provisioner "remote-exec" {
#     connection {
#       host = self.public_ip
#       user   = "root"
#       password = "DevOps321"
#     }
#     #inline is list of commands
#     inline = [
#       "echo Hey Buddy",
#       "echo Welcome Terraform Learning 2022"
      
#     ]
#   }

# }


#best practice to use this
resource "aws_instance" "web" {
  ami                    = "ami-066f46167f3ce8bfe"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0a660dbc66353e4f6"]
  
}

resource "null_resource" "cli" {

    triggers = {
      #every time to run the provisioner
      abc = timestamp()
    }

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
