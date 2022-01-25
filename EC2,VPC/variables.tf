#Set Default Region
variable "aws_region" {
	default = "ap-south-1"
}

#Default cidr and Subnet 
variable "vpc_cidr" {
	default = "10.0.0.0/16"
  
}

variable "subnets_cidr" {
	type = list
	default = ["10.0.1.0/24", "10.0.2.0/24"]
}

#define AZs

variable "azs" {
	type = list
	default = ["ap-southeast-1", "me-south-1"] #Per cloud ping from Mumbai
}