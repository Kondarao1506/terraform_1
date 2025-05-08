resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
    Name = local.resourse_name
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.ig_tags,
    {
    Name = local.resourse_name
    }
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.availability_zone[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.common_tags,
    var.subnet_public_tags,
    {
    Name = "${local.resourse_name}-public-${local.availability_zone[count.index]}" #expense-dev-public-us-east-1a or 1b
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
    var.subnet_private_tags,
    {
    Name = "${local.resourse_name}-private-${local.availability_zone[count.index]}" #expense-dev-public-us-east-1a or 1b
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
    var.subnet_database_tags,
    {
    Name = "${local.resourse_name}-database-${local.availability_zone[count.index]}" #expense-dev-public-us-east-1a or 1b
    }
  )
}


resource "aws_db_subnet_group" "default" {
  name       = local.resourse_name
  subnet_ids = aws_subnet.database[*].id
   tags = merge(
    var.common_tags,
    var.db_subnet_tags,
    {
    Name = local.resourse_name
    }
  )
}

resource "aws_eip" "nat" {
  domain   = "vpc"
  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
  Name = local.resourse_name   
   }
  )
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
  Name = local.resourse_name   
   }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.public_route_tags,
    {
  Name = "${local.resourse_name}-public"  
   }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.private_route_tags,
    {
  Name = "${local.resourse_name}-private"  
   }
  )
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.database_route_tags,
    {
  Name = "${local.resourse_name}-database"  
   }
  )
}


resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route" "private_nat" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}


resource "aws_route" "database_nat" {
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gw.id
}


#assciation route 
resource "aws_route_table_association" "public" {
  count =  length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count =  length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "database" {
  count =  length(var.database_subnet_cidrs)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}
