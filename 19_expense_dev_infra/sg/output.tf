output "vpc_id" {
  value = data.aws_ssm_parameter.vpc_id.value
   sensitive = true
}

output "id" {
  value = module.mysql_sg.id
}

output "bastian_id" {
  value = module.bastian_sg.id
}