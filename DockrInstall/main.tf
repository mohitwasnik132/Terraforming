resource "aws_instance" "docker" {
  ami                    = "ami-009110a2bf8d7dd0a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.http_sg.security_group_id]
  key_name               = local.key
  user_data              = file("dockerinstall.sh")

  root_block_device {
    volume_size = 15
  }

  tags = {
    Name    = "DockerPractice"
    project = "Docker-convenience"
  }

}