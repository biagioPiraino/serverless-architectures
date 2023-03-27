# Create a lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name = "execute_api_requests"
  role          = aws_iam_role.lambda_assume_role.arn
  filename      = "${path.module}/lambda_function_api_requests.zip"
  description   = "Execute API requests to either store or retrieve data from Dynamo DB."
  timeout       = 75
  runtime       = "python3.9"
  # The name of the method within your code that lambda calls to run your function
  # Required if the deployment package is a .zip file archive.
  handler      = "lambda_function.lambda_handler"
  package_type = "Zip"
}

# Create an IAM Policy Document with an sts:AssumeRole action
data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Create an IAM Policy Document to grant access to the Dynamo DB Table
data "aws_iam_policy_document" "dynamo_db_access" {
  statement {
    effect = "Allow"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]

    resources = [aws_dynamodb_table.dynamo_db_table.arn]
  }
}

# Create an IAM Role to attach to the lambda function
resource "aws_iam_role" "lambda_assume_role" {
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
  name               = "lambda_assume_role"
  description        = "Grants the function the permission to access AWS services and resources."
  # Grant access to perform operations on the Dynamo DB table
  inline_policy {
    name   = "access_dynamodb"
    policy = data.aws_iam_policy_document.dynamo_db_access.json
  }
}

# Allow API Gateway to Invoke the function
resource "aws_lambda_permission" "allow_gateway_to_invoke" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"
  # The source_arn references the execution arn of the API gateway.
  # For this, we need to specify the stage/HTTP-method/resource-path suffix
  # to grant a more granular permission to invoke the Lambda function from the gateway.
  # Here, the */*/requests part allows invocation from every stage on resource path 'requests', for any HTTP method.
  source_arn   = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/*/requests"
  statement_id = "AllowAPIGatewayToInvokeFunction"
}

# Output information about the lambda function
output "lambda_arn" { value = aws_lambda_function.lambda_function.arn }
output "lambda_invoke_arn" { value = aws_lambda_function.lambda_function.invoke_arn }
output "lambda_function_name" { value = aws_lambda_function.lambda_function.function_name }