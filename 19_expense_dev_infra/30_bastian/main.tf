module "bastian" {
  source = "../../20_instance_creation"
  ami_id = data.aws_ami.ami_account.id
  envionment = var.environment
  instanse_name = "bastian"
  project_name = var.project_name
  subnet_id = local.public_subnet_id
  security_group_id = [local.bastian_sg_id]
  common_tags = var.common_tags
}