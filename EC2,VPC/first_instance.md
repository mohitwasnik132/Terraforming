# The First Instance

Here we go again..
Although this directory already contains the tf files for creating one instance of EC2 and one VPC, it wasn't very beginner friendly.
So,
I tried using the documentations from terraform docs and created this new `.tf` file.
Here on, I will try and explain what I have found and some pitfalls I fell into, so you don't have to! (I am a good samaritan!:person_in_tuxedo:)

# The code

It's always better to have context of "What the hell was i thinking?", here it is,
I was planning to automate as much as i can. I am a solid lazy guy and prefer if something works for me so I can maybe do something else. (Work!? Nah! Binge a Sci-fi? hell yeah!)
I started and immediately found that this is going to take a lot of learning and only ⚔️ jedi level terraformers can achieve this great feat..humbled on the relevation I started like
a good padawan 👨🏼‍🎓.

The first step was to find how this all works..

### The region specification
```HCL
provider "aws" {
  region = "us-east-2"
}
```
This part defined where I wanted my instance to go. "us-east-2" is aws lingo for "Ohio region". I heard the aws gods pay special attention to `us-east-1` and `us-east-2`.
It was as good region as any for practice. 
This still doesn't make sense, since AWS is very security conscious and will ask for credentials.
- The first thing I did was to install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) on my WSL and Windows Terminal.
- I created a IAM user "terrademon" with _AdmininistratorAccess_ specifically for this task.
- Followed by `Key Pair` (EC2 -> Key Pairs) (this will track later, have patience!)
  - ran `aws configure` and provided terrademon's **Access-key** and **Secret-key** plus `Region = us-east-2` 

This much was enough for credential validations. Let's move ahead..

### The resource specification
```HCL
resource "aws_instance" "ec2terra" {
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
```
This part has lot to digest. Let's start from the obvious one.. **resource**
A resource is end-product of your terraform code. The one you want and aim for. Right now I want to have one EC2 instance alive and kicking at AWS console.
For this [terraform document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) says use `aws_instance` followed by any SENSIBLE name (I used ec2terra)

Resource is always populated with something called as **arguments** within the **{}** braces. It could be kept blank if resource allowed it. This is all good and dandy but you be
asking _"How do you know what to put in there??"_ and I simply answer _"Whatever you need right now"_
If you have operated inside aws console (which i assume you did, otherwise why would be even getting into this mess!) , there are some default values to everything vpc,subnet,security-groups etc.
Those are what we know as "Instance Details" (step 3 in AWS EC2 LAUNCH wizard). These are the details we need not worry right now, we are just padwans remember? Once we progress
we learn new stuff.

Right now the only things we gotta be asking are
 - What EC2 instance? 
 - In what region and what AZ ?
 - The key for user? (IF you are to access this EC2 we need the key)
 - And a good Security-Group to prevent security mishaps. ( I defined mine as tcp 22 to my-ip)

These questions become the arguments we want inside the `{}` of resource. The answers become the values we assigned to these. 

- What EC2 instance and what type?

The ec2 instances are defined with what OS they carry and what hardware. Amazon offers many Operating systems and base-line template identified as _Amazon Machine Image_ or **AMI**
short. Each AMI has unique `id` in every region. And hence you can not use AMI id from Mumbai region in EC2 for Ohio. It generates a not very informative error,
 ```HCL
  Error: Error launching source instance: InvalidAMIID.NotFound: The image id '[ami-0651f1bab1a933ae5]' does not exist
  ```
It's tricky to debug and easy to miss. You do copy the ami from AWS, you check and triple check , it's all good , but error keeps popping. And it will so if you don't copy the_
correct AMI from **correct region**_  If you see something akin to this just ⭐CHECK YOUR REGION⭐. Make sure it matches both in .tf file and AWS console where you are launching it in.
That aside, since it's a practice I (you should too) am using free tier `t2.micro` and `Amazon Linux 2 AMI id` from Ohio region.
defined by parameters `Instance type =` and `ami =` 

- In what region and What AZ ? 

The region you took ami from and the AZ in that same region ; defined with `availability_zone` parameter. I chose az -> us-east-2a 

- The key pair? `key_name`
The key pair we generated in pre-setting this exercise. Just make sure it's in same region as defined in code.

- And a good Security-Group to prevent security mishaps.
The `vpc_security_group_ids` part defines the security group for the default VPC. This ensures the added security. I enabled it for port 22 and host ip (my-ip)
Again it should be in the same region as defined in code.
And some identifying tags.


###The Finale

Pheww.. 
That was big. So finally all you gotta do ship-shape your code.
```HCL
terraform init
```
Just initialize the code 

```HCL
terraform fmt
```

This will format your code into "canonical format" . Just say it makes it neat and beautiful.

```HCL
terraform validate
```
Validate your syntax. Beware though it does not gurantee resource creation. This just tells that you have good syntax.. and THAT IS ALL! Don't think it will tell you if you got
values wrong or wrong ids etc. It checks for accepted-expected arguments. So if you mis-typed  `" '` quote, it will groan and throw tantrums but if you typed '"wrong-thing"' in those
right quotes.. it will be just as happy. 

```HCL
terraform plan
```
To check for execution plan. 

```HCL
terraform apply
```

To finnally apply the code. This will now generate the EC2 instance. Which you can check in the console.
A lot of this code can be automated.
SG, Key pair generation, User generation etc. But since main goal was to create an EC2 .. et voila! 

Happy Terraforming!



