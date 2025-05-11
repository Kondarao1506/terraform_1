module "mysql_sg" {
  source = "../18_security_group"
  project_name          = var.project_name
  environment           = var.environment
  vpcid = module.vpc.vpc_id1
  server = var.mysql_sgname
  }