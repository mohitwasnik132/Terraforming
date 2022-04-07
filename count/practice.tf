
#Simple demo for count-meta with ternary condition


provider "aws" {
  region = var.region
}


terraform {
  required_version = ">= 0.12.0"
}

#=====================DATA_SOURCE==================================


data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}



data "aws_vpc" "default" {
  default = true
}



data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id

}





#=================ubuntu =================================
resource "aws_instance" "ubuntu" {
  count                  =  var.number_of_instances == 0 ? 0 : 1
  ami                    =   data.aws_ami.ubuntu.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_all.name}"]
  key_name               = aws_key_pair.key_pair.key_name
  user_data              = <<-EOF

            #!/bin/bash
            
            sudo apt update

            sudo apt install httpd -y

            sudo service httpd start
            sudo service httpd restart
            sudo service httd enable
            chkconfig httpd on

            cd /var/www/html

            echo "<html><h1>Hello Demo Welcome To My Webpage</h1></html>" > index.html


            EOF



  root_block_device {
    volume_size = 15
  }

  tags = {
    Name    = "Ubuntu_${count.index}"
    project = "Demo-Practice"
  }

}


#================SG======================================
resource "aws_security_group" "allow_all" {
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#======KEY===========




resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "Demokey"
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "prikey" {
  filename        = "./${var.keyname}"
  content         = tls_private_key.key.private_key_pem
  file_permission = 0600
}



#=================variables=================================

variable "number_of_instances" {
  type = number
  description = "Provide number of instances to be created"
}


variable "keyname" {
  type = string
  default = "Demokey"
}
