output "instance_out" {
    value = aws_instance.terra
  }
  #aws_instance.app_server.public_ip

  output "aws_route53_record" {
    value = aws_route53_record.records
  }