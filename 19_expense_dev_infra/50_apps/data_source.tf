data "aws_ami" "ami_account"{
  most_recent = true
  owners = ["973714476881"]
  filter {
    name = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

# filter {
#     name   = "name"
#     values = ["RHEL-9-DevOps-Practice"]
#   }
    
#     filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#security groups ids fetching from ssm parameter passed by security groups
data "aws_ssm_parameter" "bastian_id" {
  name = "/${var.project_name}/${var.environment}/bastian_sg_id"
}

data "aws_ssm_parameter" "mysql_id" {
  name = "/${var.project_name}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "backend_id" {
  name = "/${var.project_name}/${var.environment}/backend_sg_id"
}

data "aws_ssm_parameter" "frontend_id" {
  name = "/${var.project_name}/${var.environment}/frontend_sg_id"
}

#subnet ids fetching from ssm parameter
data "aws_ssm_parameter" "public_subnet_id" {
  name = "/${var.project_name}/${var.environment}-public_subnet_ids"
}

data "aws_ssm_parameter" "pivate_subnet_id" {
  name = "/${var.project_name}/${var.environment}-private_subnet_ids"
}

data "aws_ssm_parameter" "database_subnet_id" {
  name = "/${var.project_name}/${var.environment}-database_subnet_ids"
}

data "aws_ssm_parameter" "ansible_sg_id" {
  name = "/${var.project_name}/${var.environment}/ansible_sg_id"
}
