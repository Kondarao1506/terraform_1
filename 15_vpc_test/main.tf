module "vpc"{
source = "../14_terraform_aws_vpc"
project_name = var.name
environment = var.environment
common_tags = var.common_tags
public_subnet_cidrs = var.public_subnet_cidrs
private_subnet_cidrs = var.private_subnet_cidrs
database_subnet_cidrs = var.database_subnet_cidrs
is_vpc_peering_establesh = var.is_vpc_peering_establesh
}