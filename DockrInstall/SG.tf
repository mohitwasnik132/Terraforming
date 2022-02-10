resource "aws_security_group" "allpubsg" {
  name        = "Public-SecurityGroup"
  description = "allows all traffic from SSH HTTP HTTPS"
  # vpc_id =  

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ALL IN SSH"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ALL IN HTTP"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALL_SG"
  }
}


