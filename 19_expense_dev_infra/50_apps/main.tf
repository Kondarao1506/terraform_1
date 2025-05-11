module "mysql" {
  source = "../../20_instance_creation"
  ami_id = data.aws_ami.ami_account.id
  envionment = var.environment
  instanse_name = "mysql"
  project_name = var.project_name
  subnet_id = local.database_subnet_id
  security_group_id = [local.mysql_sg_id]
  common_tags = var.common_tags
}

module "backend" {
  source = "../../20_instance_creation"
  ami_id = data.aws_ami.ami_account.id
  envionment = var.environment
  instanse_name = "backend"
  project_name = var.project_name
  subnet_id = local.backend_subnet_id
  security_group_id = [local.backend_sg_id]
  common_tags = var.common_tags
}

module "frontend" {
  source = "../../20_instance_creation"
  ami_id = data.aws_ami.ami_account.id
  envionment = var.environment
  instanse_name = "frontend"
  project_name = var.project_name
  subnet_id = local.public_subnet_id
  security_group_id = [local.frontend_sg_id]
  common_tags = var.common_tags
}

module "ansible" {
  source = "../../20_instance_creation"
  ami_id = data.aws_ami.ami_account.id
  envionment = var.environment
  instanse_name = "ansible"
  project_name = var.project_name
  user_data = file("config.sh")
  subnet_id = local.public_subnet_id
  security_group_id = [local. ansible_sg_id]
  common_tags = var.common_tags
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = "kondarao.online"
  records = [
    {
      name    = "mysql"
      type    = "A"
      ttl     = 1
      records = [
        module.mysql.private_ip,
      ]
    },

    {
      name    = "backend"
      type    = "A"
      ttl     = 1
      records = [
        module.backend.private_ip,
      ]
    },

    {
      name    = "frontend"
      type    = "A"
      ttl     = 1
      records = [
        module.frontend.private_ip,
      ]
    },
    
    {
      name    = ""
      type    = "A"
      ttl     = 1
      records = [
        module.frontend.public_ip,
      ]
    },

  ]
}