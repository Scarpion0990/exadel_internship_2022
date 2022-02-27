# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
  default     = "webservers-prod"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default     = "t2.micro"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ingress_ports" {
  type        = map(any)
  description = "list of ingress ports and protocols"
  default = {
    80  = "tcp"
    443 = "tcp"
    22  = "tcp"
    8   = "icmp"
  }
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "internet" {
  type    = string
  default = "0.0.0.0/0"
}

variable "network_interface_ip" {
  type    = string
  default = "10.0.0.110"
}

variable "network_interface_ip_cidr" {
  type    = string
  default = "10.0.0.110/32"
}

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
