provider "aws" {
  region = "us-east-1"  
}

resource "aws_dynamodb_table" "example" {
  name           = "tfstate"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "lockid" 
  attribute {
    name = "lockid"  
    type = "S"
  }
}
