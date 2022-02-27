provider "aws" {
  region  = "eu-central-1"
  profile = "MyAWS"
}

data "aws_ami" "latest-ubuntu" {
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

data "aws_ami" "centos" {
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

module "networking" {
  source = "./modules/networking"
}

#### Ubuntu server
resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.latest-ubuntu.id
  instance_type          = var.instance_type
  key_name               = "webserver-key"
  subnet_id              = module.networking.vpc.public_subnets[0]
  vpc_security_group_ids = [module.networking.sg_pub_id]
  user_data              = data.template_file.user_data.rendered

  provisioner "file" {
    source      = "./*.pem"
    destination = "/home/ubuntu/*.pem"

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
    Name = "Ubuntu-server"
  }
}

data "template_file" "user_data" {
  template = file("installweb.sh")
}

#### CentOS server
resource "aws_instance" "centos-server" {
  ami                         = data.aws_ami.centos.id
  instance_type               = var.instance_type
  associate_public_ip_address = false
  key_name                    = "centos-key"
  subnet_id                   = module.networking.vpc.private_subnets[0]
  vpc_security_group_ids      = [module.networking.sg_priv_id]

  tags = {
    Name = "CentOS7-server"
  }
}
