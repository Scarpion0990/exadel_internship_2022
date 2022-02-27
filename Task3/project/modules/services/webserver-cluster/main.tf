provider "aws" {
  region  = "eu-central-1"
  profile = "MyAWS"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "Exadel VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  cidr_block              = var.public_subnet_cidr_block

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "exadel internet gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "Exadel-Elastic-IP"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "Exadel-NAT-GW"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.internet
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "exadel_RTB"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.internet
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "route for private subnet"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}

resource "aws_network_interface" "my_network" {
  subnet_id       = aws_subnet.public_subnet.id
  private_ips     = [var.network_interface_ip]
  security_groups = [aws_security_group.public.id]

  tags = {
    Name = "Ubuntu private IP"
  }
}

data "aws_ami" "ubuntu_ami" {
  owners      = [var.owner_ubuntu_id]
  most_recent = true

  filter {
    name   = "name"
    values = [var.ubuntu_ami]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "centos_ami" {
  owners      = [var.owner_centos_id]
  most_recent = true

  filter {
    name   = "name"
    values = [var.caentos_ami]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_instance" "Ubuntu_web_server" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  key_name      = "webserver-key"
  user_data     = data.template_file.user_data.rendered

  network_interface {
    network_interface_id = aws_network_interface.my_network.id
    device_index         = 0
  }

  provisioner "file" {
    source      = "./centos-key.pem"
    destination = "/home/ubuntu/centos-key.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("webserver-key.pem")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = ["chmod 400 ~/centos-key.pem"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("webserver-key.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Ubuntu_server"
  }
}

data "template_file" "user_data" {
  template = file("user-data.sh")
}

resource "aws_instance" "centos-server" {
  ami                    = data.aws_ami.centos_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.private.id]
  key_name               = "centos-key"

  tags = {
    Name = "CentOS7-server"
  }
}

resource "aws_security_group" "public" {
  vpc_id      = aws_vpc.main.id
  name        = "${var.cluster_name}-public"
  description = "Allow SSH,HTTP,HTTPS, ICMP inbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.key
      to_port     = port.key == 8 ? local.any_port : port.key
      protocol    = port.value
      cidr_blocks = local.all_ips
    }
  }

  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }
}

resource "aws_security_group" "private" {
  vpc_id      = aws_vpc.main.id
  name        = "${var.cluster_name}-private"
  description = "Allow SSH, ICMP, HTTP,HTTPS inbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.key
      to_port     = port.key == 8 ? local.any_port : port.key
      protocol    = port.value
      cidr_blocks = [var.network_interface_ip_cidr]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.key
      to_port     = port.key == 8 ? local.any_port : port.key
      protocol    = port.value
      cidr_blocks = [var.network_interface_ip_cidr]
    }
  }
}

locals {
  any_port     = 0
  any_protocol = "-1"
  all_ips      = ["0.0.0.0/0"]
}
