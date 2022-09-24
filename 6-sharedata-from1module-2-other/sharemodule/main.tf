module "ec2" {
    source = "./ec2"
    sgid   = module.sg.sgid
  
}

module "sg" {
    source = "./sg"
  
}