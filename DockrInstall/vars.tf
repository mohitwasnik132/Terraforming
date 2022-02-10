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