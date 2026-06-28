resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "State_Table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

attribute {
  name = "LockId"
  type = "S"
}

  tags = {
    Name        = "State_Table"
    Environment = "production"
  }
}