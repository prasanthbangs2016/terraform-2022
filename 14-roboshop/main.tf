resource "aws_instance" "application" {

    count = length(var.components)
    #pulling from data resource
    ami = data.aws_ami.ami.image_id
    instance_type = "t3.micro"

}

