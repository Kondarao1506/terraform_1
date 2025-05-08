data "aws_ami" "ami_account"{
  most_recent = true
  owners = ["973714476881"]
  filter {
    name = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

# filter {
#     name   = "name"
#     values = ["RHEL-9-DevOps-Practice"]
#   }
    
#     filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }