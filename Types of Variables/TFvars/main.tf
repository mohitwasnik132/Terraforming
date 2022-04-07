provider "aws" {
    region = "ap-south-1"
}

variable "number_of_instances" {
    type = number
}

resource "aws_instance" "ec2" {
    ami = "ami-0651f1bab1a933ae5"
    instance_type = "t2.micro"
    count = var.number_of_instances
}