resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = var.instance_type

  tags = {
    Name = var.tagss
  }
}

}
output "ip" {
  value = aws_instance.web.private_ip
  sensitive = true
}