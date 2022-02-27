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
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

