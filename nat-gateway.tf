# nat gw
# Create Elastic IP
resource "aws_eip" "nat" {
  vpc = true
}

# Create Nat gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet-1.id
  depends_on    = [aws_internet_gateway.internet-gateway]

  tags = {
      Name = "Nat-gatyeway gue"
  }
}

# Create route table for nat gateway
resource "aws_route_table" "private-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags       = {
    Name     = "Private Route Table"
  }
}

# Route table association for private subnet
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.private-subnet-1.id
  route_table_id      = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id           = aws_subnet.private-subnet-2.id
  route_table_id      = aws_route_table.private-route-table.id
}
