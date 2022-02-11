module "http_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "http_ssh"
  description         = "Security group for HTTP/HTTPS/SSH access"

  vpc_id              = data.aws_vpc.default.id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp"]
  egress_rules        = ["all-all"]
  #Follow 
  #https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/rules.tf   variable "auto_groups" for better understanding 

}





