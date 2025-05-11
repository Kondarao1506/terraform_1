# resource "aws_security_group" "mysql" {
#   name        = local.server_name
#   vpc_id      = var.vpcid
#   tags = merge(
#     var.common_tags,
#     var.sg_tags,
#     {
#         Name = local.server_name
#     }
#   )
# }