locals {
  cluster_name = "education-eks-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source   = "./vpc"
  vpc_name = "ortproyect-eks-vpc"
}
