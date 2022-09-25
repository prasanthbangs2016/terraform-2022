data "aws_instances" "test" {}

output "instances" {
    value = data.aws_instances.test
  
}