output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_id1" {
  value = module.vpc.vpc_id1
}

output "az_info" {
  value = module.vpc.az_info
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "database_subnet_ids" {
  value = module.vpc.database_subnet_ids
}