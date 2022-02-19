#--------------x SUBNET To VPC x--------------------#

 resource "aws_subnet" "my_subnet" {
   vpc_id = aws_vpc.my_vpc.id
   cidr_block = "17.16.0.0/24"
   availability_zone = "ap-south-1a"
  tags = {
    Name = "terraform-subnet"
  }
 }
