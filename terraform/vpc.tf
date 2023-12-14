resource "aws_eks_cluster" "staging_eks_cluster" {
  name     = local.clustername
  role_arn = "arn:aws:iam::195400145213:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-0594f1940f55d70bd", "subnet-092e6157ef7c780c3"]
    security_group_ids = ["sg-06aa9121ecd538fed"]
  }
}
