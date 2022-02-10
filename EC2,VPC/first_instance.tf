provider "aws" {
  region = "us-east-2"
}

//produces error if logged in region and config region are different. Keys,SG,ami-id are region specific

resource "aws_instance" "ec2terra" {
  //ami                    = "ami-0651f1bab1a933ae5" //Amazon Linux 2 AMI (HVM)- Kernel 5.10 for ap-south-1

  ami                    = "ami-0231217be14a6f3ba"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "terra-key"
  vpc_security_group_ids = ["sg-01b08e754987e8e02"]
  tags = {
    Name    = "Terra-Instance"
    Project = "Exercise"
  }
}
