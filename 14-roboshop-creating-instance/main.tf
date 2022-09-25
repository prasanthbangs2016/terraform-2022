resource "aws_instance" "application" {

    count = length(var.components)
    #pulling from data resource
    ami = data.aws_ami.ami.image_id
    instance_type = "t3.micro"

    tags = {
      Name = "${var.components["${count.index}"]}-dev"
    }
}

#creating dns record to existing dnszone
resource "aws_route53_record" "record" {
  count     = length(var.components)
  zone_id   = "Z06386013LGCB19ECT5"
  name      = "${var.components["${count.index}"]}-dev"
  type      = "A"
  ttl       = 300
  #record   - as we have multiple ip hence *.private_ip and loop count
  records   = [aws_instance.application.*.private_ip[count.index]]
}