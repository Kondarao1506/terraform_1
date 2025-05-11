locals {
  #vpc_id = data.aws_ssm_parameter.vpc_id.value

  bastian_sg_id = data.aws_ssm_parameter.bastian_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_id.value
  frontend_sg_id = data.aws_ssm_parameter.frontend_id.value
  backend_sg_id = data.aws_ssm_parameter.backend_id.value
  ansible_sg_id =  data.aws_ssm_parameter.ansible_sg_id.value

  public_subnet_id = tolist(split(",", data.aws_ssm_parameter.public_subnet_id.value))[0]
  backend_subnet_id= tolist(split(",", data.aws_ssm_parameter.pivate_subnet_id.value))[0]
  database_subnet_id= tolist(split(",", data.aws_ssm_parameter.database_subnet_id.value))[0]
}