locals {
  sg_id = [aws_security_group.allow_ssh.id]

  domain_name = "kondarao.online"
}