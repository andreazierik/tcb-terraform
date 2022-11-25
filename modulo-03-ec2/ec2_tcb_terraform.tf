resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.public.id
  private_ips = ["12.0.0.6"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-005de95e8ff495156"
  instance_type = "t2.micro"
  #key_name = "acessossh"
  #vpc_security_group_ids = [aws_security_group.allow_http.id]

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  tags = {
    Name = "awsuse1app01"
  }
}