resource "aws_instance" "application" {

    count = length(var.components)
    #pulling from data resource
    ami = data.aws_ami.ami.image_id
    instance_type = "t3.micro"
    iam_instance_profile = "Secretmanager-readonly-access-for-roboshop-nodes"
    vpc_security_group_ids = ["sg-0a660dbc66353e4f6"]

tags = {
      Name = "${var.components["${count.index}"]}-dev"
    }
}

#creating new dns record to existing dnszone
resource "aws_route53_record" "record" {
  count     = length(var.components)
  zone_id   = "Z06386013LGCB19ECT5"
  name      = "${var.components["${count.index}"]}-dev"
  type      = "A"
  ttl       = 300
  #record   - as we have multiple ip hence *.private_ip and loop count
  records   = [aws_instance.application.*.private_ip[count.index]]
}

resource "null_resource" "ansible_apply" {
  triggers = {
    everytime = timestamp()
  }
  count     = length(var.components)
  provisioner "remote-exec" {
    connection {
      host = aws_instance.application.*.public_ip[count.index]
      user = "root"
      password = "DevOps321"

    }
    inline = [
      "sudo labauto clean",
      "ansible-pull -i localhost, -U https://github.com/prasanthbangs2016/roboshop-mutable-ansible roboshop.yml  -e HOSTS=localhost -e APP_COMPONENT_ROLE=${var.components[count.index]} -e ENV=dev -e MYSQL_PASSWORD=Roboshop@1 -e RABBITMQ_PASSWORD=roboshop123"

    ]

    
  }
}