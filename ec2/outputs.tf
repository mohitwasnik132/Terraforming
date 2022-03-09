
output "public_ip" {
  value = aws_instance.webserver.public_ip
}


output "public_dns" {
  value = aws_instance.webserver.public_dns
}

output "private_ip" {
  value = aws_instance.webserver.private_ip
}

output "private_dns" {
  value = aws_instance.webserver.private_dns
}

output "availability_zone" {
  value = aws_instance.webserver.availability_zone
}

output "ami" {
  value = aws_instance.webserver.ami
}

output "arn" {
  value = aws_instance.webserver.arn
}

output "host_id" {
  value = aws_instance.webserver.host_id
}

output "id" {
  value = aws_instance.webserver.id
}

output "instance_state" {
  value = aws_instance.webserver.instance_state
}

output "instance_type" {
  value = aws_instance.webserver.instance_type
}


output "key_name" {
  value = aws_instance.webserver.key_name
}

output "security_groups" {
  value = aws_instance.webserver.security_groups[*]
}

output "source_dest_check" {
  value = aws_instance.webserver.source_dest_check
}

output "user_data" {
  value = aws_instance.webserver.user_data
}

output "subnet_id" {
  value = aws_instance.webserver.subnet_id
}


output "vpc_security_group_ids" {
  value = aws_instance.webserver.vpc_security_group_ids
}

output "user_data_base64" {
  value = aws_instance.webserver.user_data_base64
}

output "tenancy" {
  value = aws_instance.webserver.tenancy
}

output "tags_all" {
  value = aws_instance.webserver.tags_all
}

output "associate_public_ip_address" {
  value = aws_instance.webserver.associate_public_ip_address
}

output "placement_group" {
  value = aws_instance.webserver.placement_group
}

output "cpu_core_count" {
  value = aws_instance.webserver.cpu_core_count
}

output "iam_instance_profile" {
  value = aws_instance.webserver.iam_instance_profile
}


output "monitoring" {
  value = aws_instance.webserver.monitoring
}


output "instance_detail" {
  value = {
    web_public_ip  = aws_instance.webserver.public_ip
    web_public_dns = aws_instance.webserver.public_dns
    web_private_ip = aws_instance.webserver.private_ip
  }
}



output "essential_detail" {
  value = {
    web_public_ip  = aws_instance.webserver.public_ip
    web_public_dns = aws_instance.webserver.public_dns
    web_private_ip = aws_instance.webserver.private_ip
  }
}

output "heavy_detail" {
  value = {
    web_public_ip  = aws_instance.webserver.public_ip
    web_public_dns = aws_instance.webserver.public_dns
    web_private_ip = aws_instance.webserver.private_ip
    web_private_dns = aws_instance.webserver.private_dns

    availability_zone = aws_instance.webserver.availability_zone
    ami = aws_instance.webserver.ami
    arn = aws_instance.webserver.arn
    host_id = aws_instance.webserver.host_id
    id = aws_instance.webserver.id
    instance_state = aws_instance.webserver.instance_state
    instance_type = aws_instance.webserver.instance_type
    key_name = aws_instance.webserver.key_name
    security_groups = aws_instance.webserver.security_groups[*]
    source_dest_check = aws_instance.webserver.source_dest_check
    userdata = aws_instance.webserver.user_data
    subnet = aws_instance.webserver.subnet_id
    vpc_security_group_ids = aws_instance.webserver.vpc_security_group_ids
    tenancy = aws_instance.webserver.tenancy
    associate_public_ip_address = aws_instance.webserver.associate_public_ip_address
    placement_group = aws_instance.webserver.placement_group
    iam_instance_profile = aws_instance.webserver.iam_instance_profile
  }
}