# expense dev vpc connected with default vpc resourse

resource "aws_vpc_peering_connection" "main" {
  count = var.is_vpc_peering_establesh ? 1 : 0
  vpc_id        = aws_vpc.main.id #requester
 # peer_owner_id = var.peer_owner_id  no need
  peer_vpc_id   = data.aws_vpc.selected.id #default vpc id
  auto_accept   = true

  tags = merge(
    var.common_tags,
    var.default_vpc_peer_tags,
    {
    Name = "${local.resourse_name}-defaut"
    }
  )
}

resource "aws_route" "public_peering" {
  count = var.is_vpc_peering_establesh ? 1 : 0 
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.selected.cidr_block
  vpc_peering_connection_id= aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "private_peering" {
  count = var.is_vpc_peering_establesh ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.selected.cidr_block
  vpc_peering_connection_id= aws_vpc_peering_connection.main[count.index].id
}


resource "aws_route" "database_peering" {
  count = var.is_vpc_peering_establesh ? 1 : 0
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.selected.cidr_block
  vpc_peering_connection_id= aws_vpc_peering_connection.main[count.index].id
}


resource "aws_route" "default_peering" {
  count = var.is_vpc_peering_establesh ? 1 : 0
  route_table_id            = data.aws_route_table.selected.route_table_id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id= aws_vpc_peering_connection.main[count.index].id
}

