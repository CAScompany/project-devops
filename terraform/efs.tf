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
  subnet_id      = "subnet-079ce72941a946f2a"  
  security_groups = ["sg-01793416c6e25d8e7"]
}

resource "aws_efs_mount_target" "efs2" {
  file_system_id = aws_efs_file_system.staging1-clusterEFS.id
  subnet_id      = "subnet-0b7f08495ccb0da82"  
  security_groups = ["sg-0599b33420fce76e7"]
}