resource "aws_efs_file_system" "staging-clusterEFS" {
  creation_token  = "staging-clusterEFS"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "staging-clusterEFS"
  }
}

resource "aws_efs_mount_target" "efs1" {
  file_system_id = aws_efs_file_system.staging-clusterEFS.id
  subnet_id      = "subnet-03af8dd57f4cb7846"  
  security_groups = ["sg-06aa9121ecd538fed"]
}

resource "aws_efs_mount_target" "efs2" {
  file_system_id = aws_efs_file_system.staging-clusterEFS.id
  subnet_id      = "subnet-0594f1940f55d70bd"  
  security_groups = ["sg-06aa9121ecd538fed"]
}