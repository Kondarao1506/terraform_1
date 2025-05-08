data "aws_vpc" "selected" {
  default = true
}

data "aws_availability_zones" "available" {
  state = "available"
}