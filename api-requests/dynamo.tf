# Create a dynamo db resource
resource "aws_dynamodb_table" "dynamo_db_table" {
  name     = "api_requests"
  hash_key = "request_key"

  # Provision is under Free Tier limits
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10

  attribute {
    name = "request_key"
    type = "S"
  }

  attribute {
    name = "resource"
    type = "S"
  }

  attribute {
    name = "path"
    type = "S"
  }

  attribute {
    name = "user"
    type = "S"
  }

  attribute {
    name = "date_added"
    type = "S"
  }
}

# Output information about dynamo db
output "dynamo_arn" { value = aws_dynamodb_table.dynamo_db_table.arn }
output "dynamo_id" { value = aws_dynamodb_table.dynamo_db_table.id }