resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.pubkey)
}


resource "aws_instance" "DockerReady" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  # subnet_id     =  
  vpc_security_group_ids = [local.vpc_id]
  user_data              = file("dockerinstall.sh")

  tags = {
    Name    = "DockerReady"
    PROJECT = "teradoc"
  }

  connection {
    user        = var.username
    private_key = file(var.privkey)
    host        = self.public_ip
  }

}

resource "aws_instance" "instancetrial" {
  ami                    = "ami-0851b76e8b1bce90b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [local.vpc_id]
  key_name               = aws_key_pair.mykey.key_name
  user_data              = file("trial.sh")

  connection {
    user        = var.username
    private_key = file(var.prikey)
    host        = self.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      "touch works.txt",
      "echo I am tryna be sensible >> works.txt",
    ]
  }
  tags = {
    Name    = "1Ready"
    PROJECT = "teradoc"
  }


}











resource "aws_instance" "adityatrial" {
  ami           = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  user_data     = file("adtdocker.sh")


  tags = {
    Name    = "adityatrial"
    PROJECT = "teradoc"
  }

  connection {
    user        = var.username
    private_key = file(var.privkey)
    host        = self.public_ip
  }
}








