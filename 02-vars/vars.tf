variable "test" {
  default = "hello"
}

output "test" {
  value = var.test
}

variable "test1" {}

output "test1" {
  value = var.test1
}

variable "test2" {}

output "test2" {
  value = var.test2
}

variable "test3" {}

output "test3" {
  value = var.test3
}
