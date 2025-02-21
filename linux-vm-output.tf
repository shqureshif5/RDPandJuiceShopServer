#####################################
## Virtual Machine Module - Output ##
#####################################

output "vm_linux_server_instance_id" {
  value = aws_instance.linux-server.*.id
}

# output "vm_linux_server_instance_public_dns" {
#   value = aws_instance.linux-server.*.public_dns
# }

output "vm_linux_server_eip_public_ip" {
  value = aws_eip.linux-eip.public_ip
}

output "vm_linux_server_eip_public_dns" {
  value = aws_eip.linux-eip.public_dns
}

# output "vm_linux_server_instance_public_ip" {
#   value = aws_instance.linux-server.*.public_ip
# }

# output "vm_linux_server_instance_private_ip" {
#   value = aws_instance.linux-server.*.private_ip
# }

output "rdp_password" {
  value = random_string.password.result
}

output "private_key_file_name" {
  value = aws_key_pair.key_pair.key_name
}