resource "aws_instance" "instance" {
  count = length(var.instances)
  ami = data.aws_ami.ami_account.id
  instance_type = var.instances[count.index]== "frontend"? "t3.small" : "t2.micro" 
  vpc_security_group_ids = local.sg_id
  tags = {
    Name = var.instances[count.index]
  }
}