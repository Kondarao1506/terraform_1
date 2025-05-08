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
count = length(var.all_instances)
instance_type = "t3.micro"
vpc_security_group_ids = [aws_security_group.allow_ssh.id]
tags = {
    Name = var.all_instances[count.index]
  }
}

# resource "aws_route53_record" "records" {
#   zone_id = var.zone_id
#   name    = var.all_instances[count.index].var.domain
#   type    = "A"
#   ttl     = 300
#   records = [aws_instance.terra.public_ip]
# }