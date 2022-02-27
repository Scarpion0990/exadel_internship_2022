provider "aws" {
  region  = "eu-central-1"
  profile = "MyAWS"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = var.cluster_name
  instance_type = "t2.micro"
}