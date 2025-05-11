module "mysql_sg" {
  source = "../../18_security_group"
  project_name          = var.project_name
  environment           = var.environment
  vpcid = local.vpc_id
  server = var.mysql_sgname

  }

  module "backend_sg" {
  source = "../../18_security_group"
  project_name          = var.project_name
  environment           = var.environment
  vpcid = local.vpc_id
  server = var.backend_sgname

  }

  module "frontend_sg" {
  source = "../../18_security_group"
  project_name          = var.project_name
  environment           = var.environment
  vpcid = local.vpc_id
  server = var.frontend_sgname

  }


  module "bastian_sg" {
  source = "../../18_security_group"
  project_name          = var.project_name
  environment           = var.environment
  vpcid = local.vpc_id
  server = var.bastian_sgname

  }

  module "ansible_sg" {
  source = "../../18_security_group"
  project_name          = var.project_name
  environment           = var.environment
  vpcid = local.vpc_id
  server = var.ansible_sgname
 }

  #rules for all security groups 

  resource "aws_security_group_rule" "mysql_rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id       = module.backend_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "backend_rule" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id       = module.frontend_sg.id
  security_group_id = module.backend_sg.id
}

resource "aws_security_group_rule" "frontend_rule" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "bastian_mysql_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id       = module.bastian_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "bastian_backend_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id       = module.bastian_sg.id
  security_group_id = module.backend_sg.id
}

resource "aws_security_group_rule" "bastian_frontend_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id       = module.bastian_sg.id
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "bastian_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastian_sg.id
}

#ansible ingress rules
resource "aws_security_group_rule" "ansible_mysql_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id       = module.ansible_sg.id
  security_group_id = module.mysql_sg.id
}

resource "aws_security_group_rule" "ansible_backend_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id       = module.ansible_sg.id
  security_group_id = module.backend_sg.id
}

resource "aws_security_group_rule" "ansible_frontend_rule" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
 source_security_group_id       = module.ansible_sg.id
  security_group_id = module.frontend_sg.id
}

resource "aws_security_group_rule" "ansible_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.ansible_sg.id
}

