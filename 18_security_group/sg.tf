resource "aws_security_group" "sg" {
  name        = local.server_name
  vpc_id      = var.vpcid
  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
        Name = local.server_name
    }
  )


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
}