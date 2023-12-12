locals {
  clustername = "ortproyect-eks"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = local.clustername
  role_arn = "aws:sts::731667926600:assumed-role/voclabs/user2758359=carloslopez94630@gmail.com"

  vpc_config {
    subnet_ids         = ["subnet-0055b736d06be0aad", "subnet-0e7bffcc06df511b7"]
    security_group_ids = ["sg-0badffa158bf35795"]
  }

  
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-cluster-node-group"
  node_role_arn   = "aws:sts::731667926600:assumed-role/voclabs/user2758359=carloslopez94630@gmail.com"

  subnet_ids = ["subnet-0055b736d06be0aad", "subnet-0e7bffcc06df511b7"]

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  instance_types = [t3.small]
  capacity_type  = "ON_DEMAND"

  
}

