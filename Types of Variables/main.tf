resource "aws_instance" "webservers" {
  count                  = var.instance_count
  ami                    = lookup(var.webservers_ami, var.region)
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh_access.id, aws_security_group.web_access.id]
  tags = {
    Name = "Assigment-1-${count.index + 1}"
  }

}

