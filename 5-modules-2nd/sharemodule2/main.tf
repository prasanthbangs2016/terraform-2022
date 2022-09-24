module "ec2" {
    source = "./ec2"
    sgid   = module.sg.id
  
}

module "sg" {
    source = "./sg"
  
}