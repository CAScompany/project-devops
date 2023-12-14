resource "aws_eks_node_group" "node_group" {
  cluster_name    = local.clustername
  node_group_name = "staging-eks-cascompany-cluster-node-group"
  node_role_arn   = "arn:aws:iam::195400145213:role/LabRole"

  subnet_ids = ["subnet-03af8dd57f4cb7846", "subnet-0594f1940f55d70bd"]

  scaling_config {
    desired_size = 4
    min_size     = 2
    max_size     = 10
  }

  instance_types = ["t3.small"]
  capacity_type  = "ON_DEMAND"
}