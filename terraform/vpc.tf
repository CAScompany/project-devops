resource "aws_eks_cluster" "staging_eks_cluster" {
  name     = local.clustername
  role_arn = "arn:aws:iam::195400145213:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-079ce72941a946f2a", "subnet-07473c937c3809cc4"]
    security_group_ids = ["sg-024c332cca1dd7d9a"]
  }
}
