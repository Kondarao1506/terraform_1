resource "aws_route53_record" "www" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = var.instances[count.index] == "frontend" ?  local.domain_name : "${var.instances[count.index]}.${local.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instances[count.index] == "frontend" ? [aws_instance.instance[count.index].public_ip] : [aws_instance.instance[count.index].private_ip]
}