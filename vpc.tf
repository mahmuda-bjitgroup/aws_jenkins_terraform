resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "main"
  }
}

#Creating subnet public
# resource "aws_subnet" "pubsub_1" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "192.168.0.0/25" #first private subnet
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true #ensures the public ip of an instance

#   tags = {
#     Name = "Public Subnet 1"
#   }
# }

#Creating subnet private
resource "aws_subnet" "privsub_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "192.168.0.128/25" #first private subnet
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false #ensures the public ip of an instance

  tags = {
    Name = "Private Subnet 1"
  }
}

# Creating internet gateway
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.my_vpc.id

#   tags = {
#     Name = "pubsub-1-igw"
#   }
# }

# # eip for nat
# resource "aws_eip" "nat_eip" {
#   vpc = true
#   depends_on = [ aws_internet_gateway.gw ]

# }

# #nat gateway
# resource "aws_nat_gateway" "ngw" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id = aws_subnet.pubsub_1.id

#   tags = {
#     Name = "mahmuda-nat-gateway"
#   }
# }



# # Creating route table public
# resource "aws_route_table" "pubsub-1-rt" {
#   vpc_id = aws_vpc.my_vpc.id #required

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.gw.id
#   }

#   tags = {
#     Name = "pubsub-1-rt"
#   }
#   depends_on = [ aws_internet_gateway.gw ]
# }

# # Subnet association to route table for public
# resource "aws_route_table_association" "pubsub_1_association" {
#   subnet_id      = aws_subnet.pubsub_1.id
#   route_table_id = aws_route_table.pubsub-1-rt.id
# }

# for private
# Creating route table, private
# resource "aws_route_table" "privsub-1-rt" {
#   vpc_id = aws_vpc.my_vpc.id #required

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.ngw.id
#   }

#   tags = {
#     Name = "private-1-rt"
#   }

# }

# Subnet association to route table for private
# resource "aws_route_table_association" "privsub_1_association" {
#   subnet_id      = aws_subnet.privsub_1.id
#   route_table_id = aws_route_table.privsub-1-rt.id
# }


#security group
resource "aws_security_group" "vpc_ssh" {
  name        = "vpc-ssh"
  description = "VPC SSH"

  # description = "Allow TLS inbound traffic"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "Allow Port 80"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Security Group - Web Traffic
# resource "aws_security_group" "vpc-web" {
#   name        = "vpc-web"
#   description = "Dev VPC Web"

#   vpc_id = aws_vpc.my_vpc.id
#   ingress {
#     description = "Allow Port 80"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Allow all IP and Ports outbound"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
