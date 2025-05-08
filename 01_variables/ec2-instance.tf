resource  "aws_security_group" "allow_ssh"{
    description = "allow 22 port"
    name = var.name
    tags = var.sg_name

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   
    ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.cdr_blk
    ipv6_cidr_blocks = ["::/0"]
  }
    
}

resource "aws_instance" "terra" {
ami = var.ami_id
instance_type = var.instance
vpc_security_group_ids = [aws_security_group.allow_ssh.id]
tags = var.tags
}