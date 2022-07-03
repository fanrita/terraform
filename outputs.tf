output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}

resource "local_file" "inventory" {
  content = "web-server ansible_host=${aws_instance.web.public_ip}"
  filename = "../ansible/inventory"
}
