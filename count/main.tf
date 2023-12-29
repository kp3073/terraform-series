locals {
  environment = "prod"
}
resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = var.instance_type

  tags = {
    Name = "${local.environment}-stage"
  }
}

resource "aws_iam_user" "forloop" {
  for_each = var.username
  name = each.value
}

variable "username" {
  type = set(string)
  default = ["user1", "user2","user3"]
}

variable "instance_type" {
  default = "t2.small"
}


output "ip" {
  value = aws_instance.web.private_ip
  sensitive = true
}