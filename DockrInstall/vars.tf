variable "region" {
  default = "ap-south-1"
}
variable "prikey" {
  default = "mykey"
}

variable "pubkey" {
  default = "mykey.pub"
}

variable "username" {
  default = "ubuntu"
}



locals {
  vpc_id = data.aws_vpc.default.id
}



###################################################                                                                               #
data "aws_vpc" "default" { #
  default = true           #
}                          #
#
data "aws_security_group" "default" { #
  name   = "default"                  #
  vpc_id = data.aws_vpc.default.id    #
}                                     #
###################################################