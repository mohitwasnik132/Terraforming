output "myip" {
  value = local.instance.public_ip
}

output "AZ" {
  value = local.instance.availability_zone
}

