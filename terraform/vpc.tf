module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  providers = {
    aws = aws.us_east_1
  }

  name = "vpc-ortproyecteks"

  cidr = "172.20.0.0/16"

  // Obtén las Availability Zones de us-east-1
  azs = data.aws_availability_zones.available.names

  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]
  public_subnets  = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]

  enable_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.clusterName}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.clusterName}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
