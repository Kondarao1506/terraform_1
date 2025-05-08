#vpc resourse
resource "aws_vpc" "main" {
  cidr_block       = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
        Name = "${local.vpc_name}-vpc"
    }
  )
}
# gateway resourse
resource "aws_internet_gateway" "main" {
 vpc_id = aws_vpc.main.id

 tags = merge(
    var.common_tags,
    var.gw_tags,
    {
        Name = "${local.vpc_name}-gateway"
    }
  )
}

resource "aws_eip" "static_ip" {
  domain       = "vpc"
  tags = merge(
    var.common_tags,
    var.gw_tags,
    {
        Name = "${local.vpc_name}-ip"
    }
  )
  
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.static_ip.id
  subnet_id     =  aws_subnet.public[0].id
}


resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.availability_zone[count.index]
  map_public_ip_on_launch = true
 tags = merge(
    var.common_tags,
    var.public_subnet_tags,
    {
        Name = "${local.vpc_name}-public-${local.availability_zone[count.index]}"               #expense-dev-public-us-east-1a or 1b
    }
  )
}


resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.availability_zone[count.index]
 tags = merge(
    var.common_tags,
    var.private_subnet_tags,
    {
        Name = "${local.vpc_name}-private-${local.availability_zone[count.index]}"               #expense-dev-public-us-east-1a or 1b
    }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.availability_zone[count.index]
 tags = merge(
    var.common_tags,
    var.database_subnet_tags,
    {
        Name = "${local.vpc_name}-database-${local.availability_zone[count.index]}"               #expense-dev-public-us-east-1a or 1b
    }
  )
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_route_table_tags,
    {
        Name = "${local.vpc_name}-public"               #expense-dev-public-us-east-1a or 1b
    }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.private_route_table_tags,
    {
        Name = "${local.vpc_name}-private"               #expense-dev-public-us-east-1a or 1b
    }
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.database_route_table_tags,
    {
        Name = "${local.vpc_name}-database"               #expense-dev-public-us-east-1a or 1b
    }
  )
}

resource "aws_route" "public" {
  route_table_id              = aws_route_table.public.id
   destination_cidr_block    = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.main.id
}


resource "aws_route" "private" {
  route_table_id              = aws_route_table.private.id
   destination_cidr_block    = "0.0.0.0/0"
 nat_gateway_id     = aws_nat_gateway.nat_gw.id
}

resource "aws_route" "database" {
  route_table_id              = aws_route_table.database.id
   destination_cidr_block    = "0.0.0.0/0"
 nat_gateway_id    = aws_nat_gateway.nat_gw.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidrs)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}