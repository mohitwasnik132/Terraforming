module "http-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "http_sg"
  description = "Security group for HTTP/HTTPS/ICMP access"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  #Follow 
  #https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/rules.tf   variable "auto_groups" for better understanding 

}



