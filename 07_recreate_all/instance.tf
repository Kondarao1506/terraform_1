resource "aws_instance" "instances" {
    count = length(var.instance_name)
    ami = data.aws_ami.ami.id
    tags = {
      Name = var.instance_name[count.index]
    }
     instance_type = var.instance_name[count.index] == "frontend"? "t2.micro" : "t3.micro"

     vpc_security_group_ids = [aws_security_group.sg.id]
     
}