locals {
  clustername = "ortproyect-eks"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = local.clustername
  role_arn = "arn:aws:iam::195400145213:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-079ce72941a946f2a", "subnet-0b53f4239bbe656d7"]
    security_group_ids = ["sg-06aa9121ecd538fed"]
  }

  
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-cluster-node-group"
  node_role_arn   = "arn:aws:iam::195400145213:role/LabRole"

  subnet_ids = ["subnet-079ce72941a946f2a", "subnet-0b53f4239bbe656d7"]

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  instance_types = ["t3.small"]
  capacity_type  = "ON_DEMAND"

  
}
#
#
