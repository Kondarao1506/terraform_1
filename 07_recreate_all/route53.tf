resource "aws_route53_record" "records" {
  count = length(var.instance_name)
  zone_id = var.zone_id
  name    = var.instance_name[count.index] == "frontend"? var.domain : "${var.instance_name[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = var.instance_name[count.index] != "frontend"? [aws_instance.instances[count.index].private_ip] : [aws_instance.instances[count.index].public_ip]
}


