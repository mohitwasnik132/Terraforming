output "myip" {
  value = aws_instance.DockerReady.public_ip
}

output "AZ" {
  value = aws_instance.DockerReady.availability_zone
}