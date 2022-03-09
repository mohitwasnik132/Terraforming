variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "aws_ami_id" {
  ## Ubuntu 20 LTS (HVM) - Mumbai
  type    = string
  default = "ami-0851b76e8b1bce90b"

}


variable "ansible_node_count" {
  type    = number
  default = 2
}

variable "prikey" {
  type    = string
  default = "mykey"
}

variable "pubkey" {
  type    = string
  default = "mykey.pub"
}

variable "keyname" {
  type    = string
  default = "ansikey"
}



