#default use case for key named mykey

#uncomment for using key "mykey"
# resource "aws_key_pair" "mykey" {
#   key_name   = "mykey"
#   public_key = file(var.pubkey)
# }


#Generates new key of given name

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.keyname
  public_key = tls_private_key.key.public_key_openssh
}


locals {
  private_key = tls_private_key.key.private_key_pem
}


resource "local_file" "key" {
  filename        = var.keyname
  content         = local.private_key
  file_permission = "0400"
  depends_on      = [tls_private_key.key]

}

