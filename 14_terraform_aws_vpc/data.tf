data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "selected" {
  default = true
}

data "aws_route_table" "selected" {
 vpc_id =  data.aws_vpc.selected.id
}

