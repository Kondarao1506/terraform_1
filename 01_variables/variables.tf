variable "name"{
    type = string
    default = "allow_ssh"
}

#  tags = {
#     Name = "allow_ssh"
#   }

variable "sg_name"{
    type = map 
    default = {
        Name = "allow_ssh"
    }
  }

variable "from_port"{
    type = number
    default = 22
}

variable "to_port"{
    type = number
    default = 22
}

variable "protocol"{
    type = string
    default = "tcp"
}

variable "cdr_blk" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  }

variable "instance" {
    type = string
    default = "t3.micro"
  
}

variable "tags" {
    type = map(string)
    default = {
       Name = "mysql"
      "NAME" = "mysql"
      "PROJECT" = "expence"
      "MODULE" = "mysql"
      "ENVIRONMENT" = "development"
    }
  
}