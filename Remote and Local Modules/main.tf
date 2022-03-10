module "vpc_remote" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name        = "Remote-vpc"
    Environment = "dev"
  }
}





module "instance" {
  source = "./ec2"

}
  
 # module "instance" {
 # source = "./ec2"
 #   ami  = data.aws_ami.<name>.image_id
 #   keyname = "<your-key-name>"

#}
  
  #ami - use data source to call uopn desied os ami_id. 
  #"Keyname" - key of name keyname  will be auto generated and applied and private key can be found in root directory.
  
