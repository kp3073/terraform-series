locals {
  enviroment = "stage"
}
resource "aws_vpc" "staging-vpc" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.enviroment}-vpc-tag"
  }
}

resource "aws_subnet" "staging-subnet" {
  vpc_id = aws_vpc.staging-vpc.id
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.enviroment}-subnet-tag"
  }
}

resource "aws_instance" "ec2_example" {

  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.staging-subnet.id

  tags = {
    Name = "${local.enviroment} - Terraform EC2"
  }
}

output "ip" {
  value = aws_instance.ec2_example.public_ip
}