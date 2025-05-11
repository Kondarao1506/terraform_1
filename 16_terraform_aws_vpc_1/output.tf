output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "vpc_id1" {
  value = aws_vpc.main.id
}

output "az_info" {
  value = data.aws_availability_zones.available.names
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "database_subnet_ids" {
  value = aws_subnet.database[*].id
}
