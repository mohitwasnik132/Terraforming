#--------------x SG attached to SUBNET x--------------------#

resource "aws_security_group" "allow_http" {
  name = "allow_http"
  description = "Allows the tcp/http:80 connections"
  vpc_id = aws_vpc.my_vpc.id


  ingress = {
    description = "allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [aws_vpc.my_vpc.cidr_block]
    

  } 


  egress = {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow HTTP"
    from_port = 80
    ipv6_cidr_blocks = [ "::/0" ]
    protocol = "tcp"
    to_port = 80
  }

  tags = {
    Name = "allow http"
  } 
}
