resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = "${var.instance_type}"
  key_name = "${var.keyname}"
  user_data = var.userdata
  security_groups = "${var.securitygroups}"

  tags = {
    Name = "${var.name}"
  }
}






resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.keyname
  public_key = tls_private_key.key.public_key_openssh
}


resource "local_file" "key" {
  filename = "${var.keyname}"
  content = "${local.private_key}"
   file_permission      = "0400"
  depends_on =[tls_private_key.key]
  
}
