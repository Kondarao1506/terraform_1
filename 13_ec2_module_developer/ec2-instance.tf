resource "aws_instance" "terra" {
count = length(var.servers_instances)
ami = var.ami_id
instance_type = var.instance_type
vpc_security_group_ids = var.sg_ids
tags = {
    Name = var.servers_instances[count.index]
  }
    
}