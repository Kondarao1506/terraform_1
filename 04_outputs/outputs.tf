output "instance_out" {
    value = aws_instance.terra.public_ip
  }
  #aws_instance.app_server.public_ip