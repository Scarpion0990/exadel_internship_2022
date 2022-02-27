variable "owner_ubuntu_id" {
  type    = string
  default = "099720109477"
}

variable "ubuntu_ami" {
  type    = string
  default = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "owner_centos_id" {
  type    = string
  default = "374168611083"
}

variable "caentos_ami" {
  type    = string
  default = "eu-central-1 image for x86_64 CentOS_7"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default     = "t2.micro"
}