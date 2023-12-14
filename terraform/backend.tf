terraform {
  backend "s3" {
    bucket         = "terraformstatesbucket"
    key            = "ekscompany-stage/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  #  dynamodb_table = "tfstate"
  }
}
#