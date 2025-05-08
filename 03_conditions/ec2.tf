resource  "aws_security_group" "allow_ssh"{
    description = "allow 22 port"
    name = "allow_ssh"
    tags = {
    Name = "allow_ssh"
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   
    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    
}

resource "aws_instance" "terra" {
ami = "ami-09c813fb71547fc4f"
instance_type = var.environment=="prod" ? "t3.micro" : "t3.small"
vpc_security_group_ids = [aws_security_group.allow_ssh.id]
tags = {
    Name = "terraform"
  }
    
}