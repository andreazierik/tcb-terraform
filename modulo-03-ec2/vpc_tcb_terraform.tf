#criacao da vpc principal
resource "aws_vpc" "vpc_main" {
  cidr_block = "12.0.0.0/16"

  tags = {
    Name = "vpc_tcb_terraform"
  }
}

#public subnet para instancia do EC2
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "12.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet_tcb_terraform"
  }
}

#private subnet1 para RDS
resource "aws_subnet" "subnet_private_1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "12.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private1_subnet_tcb_terraform"
  }

}

#private subnet2 para RDS
resource "aws_subnet" "subnet_private_2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "12.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private2_subnet_tcb_terraform"
  }
}