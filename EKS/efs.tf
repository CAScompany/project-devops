resource "aws_efs_file_system" "clusterEFS" {
  creation_token  = "clusterEFS"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "clusterEFS"
  }
}

resource "aws_efs_mount_target" "example" {
  file_system_id = aws_efs_file_system.clusterEFS.id
  subnet_id      = "subnet-079ce72941a946f2a"  
  security_groups = ["sg-024c332cca1dd7d9a"]
}

resource "aws_efs_mount_target" "example2" {
  file_system_id = aws_efs_file_system.clusterEFS.id
  subnet_id      = "subnet-07473c937c3809cc4"  
  security_groups = ["sg-024c332cca1dd7d9a"]
}
