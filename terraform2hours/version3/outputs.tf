# outputs file
# using a format that helps for clarity 

output "server_private_ip___________" { value = aws_instance.ejb-webserver.private_ip }
output "server_public_dns___________" { value = aws_eip.one.public_dns }
output "server_public_ip1___________" { value = aws_eip.one.public_ip }
output "server_public_ip2___________" { value = aws_instance.ejb-webserver.public_ip }
output "server_id___________________" { value = aws_instance.ejb-webserver.id }

output "ssh_command" {
  value = "ssh -i ~/.ssh/ej.pem ubuntu@${aws_eip.one.public_ip}"
}

output "browser" {
  value = "http://${aws_eip.one.public_ip}"
}