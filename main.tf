module "test" {
  source = "./test"

}

#creating 2 instance with same source with different module name
module "test1" {
  source = "./test"

}