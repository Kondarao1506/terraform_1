output "publicip" {
  value = module.ec2.public_ip
}

output "private_ip" {
  value = module.ec2.private_ip
}