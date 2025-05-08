variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro","t3.medium","t3.small"], var.instance_type)
    error_message = "This application requires only t3.micro,t3.medium,t3.small."
  }
}

variable "sg_ids" {
  type = list(string)
}

variable "servers_instances" {
  type = list(string)
}