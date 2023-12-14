resource "aws_eks_node_group" "node_group" {
  cluster_name    = local.clustername
  node_group_name = "staging1-eks-cascompany-cluster-node-group"
  node_role_arn   = "arn:aws:iam::195400145213:role/LabRole"

  subnet_ids = ["subnet-0b53f4239bbe656d7", "subnet-0b7f08495ccb0da82"]

  scaling_config {
    desired_size = 4
    min_size     = 2
    max_size     = 10
  }

  instance_types = ["t3.small"]
  capacity_type  = "ON_DEMAND"
}