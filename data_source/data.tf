provider "aws" {
  region = var.region
}


variable "region" {
  type = string

}


#=============WIN-SERVER-12=========================#


data "aws_ami" "windows_12" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2012-R2_RTM-English-64Bit-Base-*"]
  }
}


#=============WIN-SERVER-19=========================#

data "aws_ami" "windows_19" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


#=============UBUNTU-LATEST=========================#


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


#=============CENTOS-LATEST=========================#

data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

#=============AMAZON2-LINUX-LATEST=========================#

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}




#=============OUTPUTS=========================#



locals {
  name = {
    
    UBUNTU                  = [data.aws_ami.ubuntu.name, data.aws_ami.ubuntu.image_id]
    AMAZON Linux            = [data.aws_ami.amazon_linux.name, data.aws_ami.amazon_linux.image_id]
    CENTOS                  = [data.aws_ami.centos.name, data.aws_ami.centos.image_id]
    WINDOWS-SERVER-12       = [data.aws_ami.windows_12.name, data.aws_ami.windows_12.image_id]
    WINDOWS-SERVER-19       = [data.aws_ami.windows_19.name, data.aws_ami.windows_19.image_id]
  }
}

output "all" {
  value = [var.region, local.name]
}
