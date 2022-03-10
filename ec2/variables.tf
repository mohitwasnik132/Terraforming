variable "name" {
  type = string
  default = "Local_webserver"
}

variable "ami" {
  type        = string
  default     = ""
}
variable "instance_count" {
  type    = number
  default = 1
}



variable "region" {
  type    = string
  default = "ap-south-1"
}




variable "instance_type" {
  type = string
  default = "t2.micro"
}





variable "ami_id" {
  type = map(any)
  default = {
    us-east-2  = "ami-01893222c83843146"
    us-east-1  = "ami-0a8b4cd432b1c3063"
    ap-south-1 = "ami-0851b76e8b1bce90b" # Ubuntu Server 20.04 LTS (HVM)
  }
}

variable "securitygroups" {
  type = list(any)
  default = ["demo_allow_all"]
}

variable "userdata" {
  type = string
  default = <<-EOF
          #!/bin/bash
            
          sudo apt update

          sudo apt install apache2 -y
          sudo hostnamectl set-hostname UBUNTU

          sudo systemctl start apache2

          sudo ufw allow 'Apache Full'
          
          sudo systemctl restart apache2
          
          sudo systemctl enable apache2

          cd /var/www/html;
          sudo chmod 777 index.html

          echo "<html><h1><marquee>You are here on $HOSTNAME via EC2-Module in Terraform</marquee></h1></html> " > index.html;

          EOF
}


variable "keyname" {
  type = string
  default = "tfkey"
}

variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}

locals {
  ssh = aws_security_group.ssh_access.id
  web = aws_security_group.web_access.id
  private_key =tls_private_key.key.private_key_pem
}

