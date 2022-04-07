output "instance_detail" {
  value = {
    web_public_ip  = element(aws_instance.webservers.*.public_ip, 0)
    web_public_dns = element(aws_instance.webservers.*.public_dns, 0)
    web_private_ip = element(aws_instance.webservers.*.private_ip, 0)
  }
}