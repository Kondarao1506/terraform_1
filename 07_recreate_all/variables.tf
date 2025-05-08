variable "instance_name" {
  type = list(string)
  default = ["mysql","backend","frontend"]
}

 variable "instance_type" {
   default = "t3-micro"
 }

 variable "from_port"{
    default = 22
 }

 variable "to_port"{
    default = 22
 }

 variable "protocol"{
    default = "tcp"
 }

 variable "cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
   
 }

 variable "domain" {
   default = "kondarao.online"
 }

 variable "zone_id" {
    default = "Z07149973GXLT5HIK2EJO"
 }