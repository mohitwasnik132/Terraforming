# Day - 1 Provider : AWS Resource : EC2, VPC

resource "aws_vpc" "vpc_tf" {
    cidr_block = var.vpc_cidr          
    tags = {
        Name = "dev_vpc"
    
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc_tf.id
    cidr_block = var.subnets_cidr[0]
    tags = {
        Name = "dev-vpc"
    
    }

}
# resource "aws_instance" "dev_instance_linux" {
#     ami = "ami-0c1a7f89451184c8b"
#     instance_type = "t2.micro"  # Free Tier
#     key_name = ""
#     tags = {
#         Name = Linux_instance
#     }
  
# }

