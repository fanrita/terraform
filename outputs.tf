output "web_server_public_ip" {
  value = aws_instance.web.public_ip
}

output "master_server_public_ip" {
  value = aws_instance.master.public_ip
}

output "replica_server_public_ip" {
  value = aws_instance.replica.public_ip
}

output "master_server_private_ip" {
  value = aws_instance.master.private_ip
}

output "replica_server_private_ip" {
  value = aws_instance.replica.private_ip
}

resource "local_file" "inventory" {
  content =<<EOF
web-server ansible_host=${aws_instance.web.public_ip}
[db_servers]
master ansible_host=${aws_instance.master.public_ip} private_ip=${aws_instance.master.private_ip} server_id=101
replica ansible_host=${aws_instance.replica.public_ip} private_ip=${aws_instance.replica.private_ip} server_id=102
EOF
  filename = "../ansible/inventory"
}