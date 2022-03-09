output "instance_detail" {
  value = {


    control_public_ip  = element(aws_instance.control.*.public_ip, 0)
    control_public_dns = element(aws_instance.control.*.public_dns, 0)
    control_private_ip = element(aws_instance.control.*.private_ip, 0)


  }
}


# output "public_ip_address" {
#   value = formatlist("%s = %s", aws_instance.nodes[*].tags.Name, aws_instance.nodes.*.public_ip)

# }