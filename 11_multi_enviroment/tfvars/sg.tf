resource "aws_security_group" "loopsg" {
  # ... other configuration ...
    name        = "allowssh-${var.sg-envi}"
    description = "Allow TLS inbound traffic and all outbound traffic"
    tags ={
        Name = "allowssh-${var.sg-envi}"
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