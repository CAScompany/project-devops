resource "aws_eks_cluster" "staging_eks_cluster" {
  name     = local.clustername
  role_arn = "arn:aws:iam::195400145213:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-03af8dd57f4cb7846", "subnet-0594f1940f55d70bd"]
    security_group_ids = ["sg-06aa9121ecd538fed"]
  }
}
