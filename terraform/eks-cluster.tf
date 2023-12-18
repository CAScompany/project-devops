resource "aws_eks_cluster" "eks_cluster" {
  name     = var.clusterName
  role_arn = var.role_arn


  vpc_config {
#    vpc_id             = module.vpc.vpc_id             
    subnet_ids         = ["subnet-02de751429ab79f4c","subnet-09da8a3bb41a01fd1"]
    security_group_ids = ["sg-0d6dfe2539411ae1e"]
  }

  tags = {
    Environment = "produccion"
  }
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "eks-cluster-node-group"
  node_role_arn   = var.role_arn

  subnet_ids = module.vpc.private_subnets

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  instance_types = [var.ec2_instance_type]
  capacity_type  = "ON_DEMAND"


}