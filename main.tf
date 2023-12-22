
resource "aws_instance" "web" {
  ami = "ami-03265a0778a880afb"
  instance_type = var.instance_type
  count = var.count2
  associate_public_ip_address = var.enable_ip

  tags = var.tagss
}

variable "instance_type"{
  description = "instance type"
  type = string
  default = "t3.micro"
}

variable "count2" {
  description = "number of instance"
  type = number
  default = 1
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

variable "tagss" {
  type = map(string)
  default = {
    enviroment = "dev"
    project = "alpha"
  }
}