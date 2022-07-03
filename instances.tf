resource "aws_key_pair" "devops" {
  key_name = "devops-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_instance" "web" {
  ami           = var.ubuntu
  instance_type = "t2.micro"

  key_name = aws_key_pair.devops.key_name

  vpc_security_group_ids = [
    aws_security_group.web_server_sg.id
  ]

  tags = {
    Name = "web"
  }
}
