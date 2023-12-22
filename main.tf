
resource "aws_instance" "web" {
  ami = "ami-03265a0778a880afb"
  instance_type = var.instance_type
  count = var.count2
  associate_public_ip_address = var.enable_ip

  tags = {
    Name = "terraform"
  }
}

variable "instance_type"{
  description = "instance type"
  type = string
  default = "t3.medium"
}

variable "count2" {
  description = "number of instance"
  type = number
  default = 2
}

variable "enable_ip" {
  description = "Enable ip address"
  type = bool
  default = true
}

resource "aws_iam_user" "name" {
  count = length(var.username)
  name = var.username[count.index]
}

variable "username" {
  type = list(string)
  default = ["user1" , "user2", "user3"]
}