#--------------x AWS INSTANCE x--------------------#

resource "aws_instance" "docker" {
  ami                    = "ami-009110a2bf8d7dd0a"
  instance_type          = "t2.micro"
  
  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index = 0
  }
  root_block_device {
    volume_size = 15
  }

  tags = {
    Name    = "module-server"
    
  }

}

