resource "aws_efs_file_system" "staging1-clusterEFS" {
  creation_token  = "staging1-clusterEFS"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "staging1-clusterEFS"
  }
}

resource "aws_efs_mount_target" "efs1" {
  file_system_id = aws_efs_file_system.staging1-clusterEFS.id
  subnet_id      = "subnet-03af8dd57f4cb7846"  
  security_groups = ["sg-06aa9121ecd538fed"]
}

resource "aws_efs_mount_target" "efs2" {
  file_system_id = aws_efs_file_system.staging1-clusterEFS.id
  subnet_id      = "subnet-09fa2047d52d903ef"  
  security_groups = ["sg-06aa9121ecd538fed"]
}