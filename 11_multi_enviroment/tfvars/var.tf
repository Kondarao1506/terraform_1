variable "map_instances" {
  type = map(string)
  
}


variable "common_tags" {
    type = map(string)
    default = {
      "project" = "expense"
    }
}

variable "environment" {
  type = map(string)
  
}

variable "sg-envi" {
  
}