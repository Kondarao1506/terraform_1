variable "sg_name" {
  default = "shh_allow"
}

variable "discription" {
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "tags" {
  type = map(string)
  default = {
    "Name" = "ssh_protocol"
  }
}

variable "from_port" {
  default = 22
}

variable "to_port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}

variable "cidr_blocks" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "instances" {
  type = list(string)
  default = [ "mysql", "backend", "frontend" ]
}

variable "zone_id" {
    default = "Z07149973GXLT5HIK2EJO"
 }