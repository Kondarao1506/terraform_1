variable "map_instances" {
  type = map(string)
  default = {
    "mysql" = "t3.micro"
    "backend" = "t3.micro"
    "frontend" = "t2.micro"
  }
}