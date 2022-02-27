data "aws_availability_zones" "available" {}

module "vpc" {
  source                       = "terraform-aws-modules/vpc/aws"
  name                         = "exadel-vpc"
  cidr                         = var.vpc_cidr_block
  azs                          = data.aws_availability_zones.available.names
  private_subnets              = [var.private_subnet_cidr_block]
  public_subnets               = [var.public_subnet_cidr_block]
  create_database_subnet_group = true
  enable_nat_gateway           = true
  single_nat_gateway           = true
}


resource "aws_security_group" "allow_pub" {
  name        = "allow_pub"
  description = "Allow SSH,HTTP,HTTPS, ICMP inbound traffic"
  vpc_id      = module.vpc.vpc_id

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

  tags = {
    Name = "allow_pub"
  }
}


resource "aws_security_group" "allow_priv" {
  name        = "allow_priv"
  description = "Allow SSH, ICMP, HTTP,HTTPS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.key
      to_port     = port.key == 8 ? local.any_port : port.key
      protocol    = port.value
      cidr_blocks = local.priv_ips
    }
  }

  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
    cidr_blocks = local.priv_ips
  }

  tags = {
    Name = "allow_priv"
  }
}

locals {
  any_port     = 0
  any_protocol = "-1"
  all_ips      = ["0.0.0.0/0"]
  priv_ips     = ["10.0.0.0/16"]
}
