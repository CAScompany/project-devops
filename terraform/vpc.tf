resource "aws_eks_cluster" "staging_eks_cluster" {
  name     = local.clustername
  role_arn = "arn:aws:iam::195400145213:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-0b53f4239bbe656d7", "subnet-0b7f08495ccb0da82"]
    security_group_ids = ["sg-01793416c6e25d8e7", "sg-0599b33420fce76e7"]
  }
}
