variable "instance_count" {
  type    = number
  default = 1
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "cidr_blocks" {
  type = list(any)
  default = ["0.0.0.0/0"]
}


variable "webservers_ami" {
  type = map(any)
  default = {
    us-east-2  = "ami-01893222c83843146"
    us-east-1  = "ami-0a8b4cd432b1c3063"
    ap-south-1 = "ami-0851b76e8b1bce90b" # Ubuntu Server 20.04 LTS (HVM)
  }
}



variable "recent" {
  type    = bool
  default = true
}


locals {
  ssh = aws_security_group.ssh_access.id
  web = aws_security_group.web_access.id
}

