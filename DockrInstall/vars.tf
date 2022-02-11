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
  sgpub = aws_security_group.allpubsg.id
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