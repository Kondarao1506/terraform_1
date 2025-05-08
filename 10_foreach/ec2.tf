resource "aws_instance" "foreach_instances" {
    for_each = var.map_instances
    ami = data.aws_ami.forloop_ami.id
    instance_type = each.key == "frontend"? "t2.micro" : "t3.micro"
    tags={
        Name = each.key
    }
    vpc_security_group_ids = [aws_security_group.loopsg.id]
}