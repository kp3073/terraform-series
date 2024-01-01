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

resource "aws_iam_user" "example" {
  for_each = var.forloop
  name = each.value
}

variable "forloop" {
  type = set(string)
  default = ["user1", "user2"]
}

variable "instance_type" {
  type = string
  default = "t2.small"
}