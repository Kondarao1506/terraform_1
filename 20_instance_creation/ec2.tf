resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_id
  user_data = var.user_data
  tags = merge(
    var.common_tags,
    var.instanse_tags,
    {
        Name = local.instanse_name
    }
  )
}