variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}
#optional
variable "common_tags" {
  default = {}
}

variable "enable_dns_hostnames" {
  default = true
}
#optional
variable "vpc_tags" {
  default = {}
}

variable "ig_tags" {
  default = {}
}

variable "public_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) == 2 
    error_message = "user should provide 2 subnet cidrs"
  }
}

variable "subnet_public_tags" {
  default = {}
}


variable "private_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.private_subnet_cidrs) == 2 
    error_message = "user should provide 2 subnet cidrs"
  }
}

variable "subnet_private_tags" {
  default = {}
}

variable "database_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.database_subnet_cidrs) == 2 
    error_message = "user should provide 2 subnet cidrs"
  }
}

variable "subnet_database_tags" {
  default = {}
}

variable "db_subnet_tags" {
  default = {}
}

variable "nat_gateway_tags" {
  default = {}
}

variable "public_route_tags" {
  default = {}
}

variable "private_route_tags" {
  default = {}
}

variable "database_route_tags" {
  default = {}
}

variable "is_vpc_peering_establesh" {
  type = bool
  default = false
}
variable "default_vpc_peer_tags" {
  default = {}
}