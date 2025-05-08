variable "all_instances"{
    type = list(string)
    default = [ "mysql","backend","frontend" ]
}

variable "zone_id" {
    default = "Z07149973GXLT5HIK2EJO"
  }

  variable "domain" {
    default = "kondarao.online"
  }