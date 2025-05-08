variable "all_instances"{
    type = list(string)
    default = [ "mysql","backend","frontend" ]
}