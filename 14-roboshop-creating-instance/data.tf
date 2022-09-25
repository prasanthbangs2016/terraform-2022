#getting ami id
data "aws_ami" "ami" {
    most_recent = true
    name_regex  = "devops-practice-centos-with-ansible"
    owners      = ["self"]
  
}