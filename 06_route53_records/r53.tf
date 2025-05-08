resource "aws_route53_record" "records" {
  count = length(var.all_instances)
  zone_id = var.zone_id
  name    = "${var.all_instances[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.terra[count.index].private_ip]
}
#output "instance_out"
#aws_instance" "terra"

# resource "aws_route53_record" "www" {
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = "www.example.com"
#   type    = "A"
#   ttl     = 300
#   records = [aws_eip.lb.public_ip]
# }