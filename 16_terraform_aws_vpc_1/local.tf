locals {
  vpc_name = "${var.project_name}-${var.environment}"
  availability_zone = slice(data.aws_availability_zones.available.names,0,2)
  #server_name = "${var.project_name}-${var.environment}-${var.server}"
}

