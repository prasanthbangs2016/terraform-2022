data "aws_instances" "test" {
    instance_state_names = ["running", "stopped"]
}

#display instances which are running
output "instances" {
    value = data.aws_instances.test
  
}