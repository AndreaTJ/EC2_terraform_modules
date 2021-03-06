
resource "aws_subnet" "subnet-1" {
  vpc_id            = var.vpc_id #Variable-->aws_vpc.prod-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "prod-subnet"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = var.route_table_id #Variable-->aws_route_table.prod-route-table.id
}

resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [var.security_groups_id] #Variable-->[aws_security_group.allow_web.id]
}
resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [var.internet_gateway] #Variable-->[aws_internet_gateway.gw]
}