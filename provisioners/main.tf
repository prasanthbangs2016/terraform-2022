resource "aws_instance" "web" {
  ami                    = "ami-066f46167f3ce8bfe"
  instance_type          = "t3.micro"
  vpc_security_group_ids = "sg-0a660dbc66353e4f6"

  #specified connection details

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      username = "root"
      password = "DevOps321"
    }
    #inline is list of commands
    inline = [
      "echo Hey Buddy",
      "echo Welcome Terraform Learning 2022"
      
    ]
  }

}