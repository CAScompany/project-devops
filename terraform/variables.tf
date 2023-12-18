variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "clusterName" {
  description = "produccion"
  type        = string
  default     = "produccion-eks"
}
variable "role_arn" {
  description = "role"
  type        = string
  default     = "arn:aws:iam::976665439780:role/eks-role"
}
variable "ec2_instance_type" {
  description = "role"
  type        = string
  default     = "t3.small"
}