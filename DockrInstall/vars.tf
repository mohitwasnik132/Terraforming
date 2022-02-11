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

  key      = aws_key_pair.mykey.key_name
  instance = aws_instance.docker
}


