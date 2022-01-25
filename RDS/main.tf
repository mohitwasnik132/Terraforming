
#-------------------------------------------------------------------------------
# Install aws-cli. 

# at %USERPROFILE%.aws\credentials insert following detail


# [YourProfileName]
# aws_access_key_id=**************
# aws_secret_access_key=************

#1.Use this [YourProfileName] in provider module along with region
#2. run->>  setx AWS_PROFILE Mohit  # sets env variable

# Above steps are essential to avoid >>> 
#Error: error configuring Terraform AWS Provider: no valid credential sources for Terraform AWS Provider found.
#-------------------------------------------------------------------------------


provider "aws" {
  region     = "ap-south-1"
  profile = "YourProfileName"
  # access_key = "my-access-key"		#alternatively...
  # secret_key = "my-secret-key"
}


resource "aws_db_instance" "example" {
  identifier              = "terra-rds"
  engine                  = "mysql"
  engine_version          = "5.6"
  port                    = 3306
  name                    = "test_db"
  username                = "test"
  password                = "onetwo3four"
  instance_class          = "db.t2.micro"
  allocated_storage       = 5
  skip_final_snapshot     = true
 
}
