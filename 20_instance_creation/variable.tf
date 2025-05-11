variable "common_tags" {
  default = {}
}

variable "instanse_tags" {
  default = {}
}

variable "project_name" {
  
}

variable "envionment" {
  
}

variable "instanse_name" {
  
}


variable "ami_id" {
  
}

variable "subnet_id" {
  
}

variable "security_group_id" {
  type = list(string)
}

variable "user_data" {
  default = ""
}