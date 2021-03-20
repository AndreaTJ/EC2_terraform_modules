provider "aws" {
  region     = "eu-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}


module "ec2" {
  source = "./ec2"
  network_interface_id = module.subnets.network_interface_id

}

module "subnets" {
  source = "./subnets"

  vpc_id = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
  security_groups_id = module.vpc.security_group_id
  internet_gateway = module.vpc.internet_gateway

}

module "vpc" {
  source = "./vpc"
}