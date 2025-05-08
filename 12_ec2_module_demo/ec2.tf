module "ec2" {
  source = "../13_ec2_module_developer"
  servers_instances = var.instances
  instance_type = "t3.small"
  ami_id = data.aws_ami.forloop_ami.id
  sg_ids = [aws_security_group.allow_ssh.id]
}