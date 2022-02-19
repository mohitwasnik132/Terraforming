#--------------x NIC to INSTANCE x--------------------#

resource "aws_network_interface" "nic" {
  subnet_id = aws_subent.my_subnet.subnet_id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "Primary_network_interface"
  }
}

