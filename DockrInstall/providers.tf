provider "aws" {
  region = "ap-south-1"
}

terraform {
  required_version = ">= 0.12.0"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
  
}


# data "aws_subnet" "all" {
#   vpc_id =   data.aws_vpc.default.id
# }
