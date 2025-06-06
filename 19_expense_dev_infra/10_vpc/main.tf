module "vpc" {
  source                = "../../16_terraform_aws_vpc_1"
  #source = "git::https://github.com/Kondarao1506/terraform_1.git?ref=main"
  project_name          = var.project_name
  environment           = var.environment
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
}