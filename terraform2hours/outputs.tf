# output "server_public_ip_1" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_eip.one.public_ip
# }

# output "server_private_ip" {
#   description = "Private IP address of the EC2 instance"
#   value       = aws_instance.ejb-webserver.private_ip
# }

# output "server_public_dns" {
#   description = "Public DNS of the EC2 instance"
#   value       = aws_instance.ejb-webserver.public_dns
# }

# output "server_id" {
#   description = "EC2 instance ID"
#   value       = aws_instance.ejb-webserver.id
# }


output "server_private_ip___________" { value = aws_instance.ejb-webserver.private_ip }
output "server_public_ip1___________" { value = aws_eip.one.public_ip }
output "server_public_ip2___________" { value = aws_instance.ejb-webserver.public_ip }
output "server_public_dns___________" { value = aws_instance.ejb-webserver.public_dns }
output "server_id___________________" { value = aws_instance.ejb-webserver.id }
