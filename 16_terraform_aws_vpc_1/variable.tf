#cidr for vpc
variable "cidr" {
  default = "10.0.0.0/16"
}

#mandatory user should provide
variable "project_name" {
  type = string
}
#mandatory user should provide
variable "environment" {
  type = string
}

# variable "server" {
  
# }

#common tags for vpc optional
variable "common_tags" {
  default = {}
}

variable "vpc_tags" {
  default = {}
}

variable "enable_dns_hostnames" {
  default = true
}

variable "gw_tags" {
  default = {}
}

variable "public_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.public_subnet_cidrs) == 2 
    error_message = "user should provide 2 subnet cidrs"
  }
  
}

variable "private_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.private_subnet_cidrs) == 2 
    error_message = "user should provide 2 subnet cidrs"
  }
  
}

variable "database_subnet_cidrs" {
  type = list(string)
  validation {
    condition     = length(var.database_subnet_cidrs) == 2 
    error_message = "user should provide 2 subnet cidrs"
  }
  
}

variable "public_subnet_tags" {
  default = {}
}

variable "private_subnet_tags" {
  default = {}
}

variable "database_subnet_tags" {
  default = {}
}

variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {
  default = {}
}

variable "database_route_table_tags" {
  default = {}
}

variable "sg_tags" {
  default = {}
}

# variable "vpcid" {
  
# }