
#uncomment for auto generated key and comment line above it
resource "aws_instance" "control" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
  #key_name      = aws_key_pair.mykey.key_name
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = ["ansible-sg"]
  user_data       = file("ansiblecontrol.sh")


  provisioner "file" {

    source      = "assignment.yaml"
    destination = "/home/ubuntu/assignment.yaml"

    connection {
      user = "ubuntu"
      type = "ssh"
      #private_key = file(var.prikey)
      private_key = local.private_key
      host        = self.public_ip
    }

  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60; ansible-playbook assignment.yaml"
    ]
    connection {
      type = "ssh"
      user = "ubuntu"
      #private_key = file(var.prikey)
      private_key = local.private_key
      host        = self.public_ip
    }

  }


  tags = {
    Name = "ansible-control"
  }
}




#DO NOT directly execute remote-exec to play ansible playbook.
#since instance is still provisioning/booting it will fail.