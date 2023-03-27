# Create a HTTP API Gateway
resource "aws_apigatewayv2_api" "api_gateway" {
  name          = "http-api"
  protocol_type = "HTTP"
}

# Create a lambda integration
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id           = aws_apigatewayv2_api.api_gateway.id
  integration_type = "AWS_PROXY"

  connection_type      = "INTERNET"
  description          = "Lambda integration for HTTP requests."
  integration_method   = "POST"
  integration_uri      = aws_lambda_function.lambda_function.invoke_arn
  passthrough_behavior = "WHEN_NO_MATCH"
}

# Create routes
resource "aws_apigatewayv2_route" "get_route" {
  api_id    = aws_apigatewayv2_api.api_gateway.id
  route_key = "GET /requests"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_route" "post_route" {
  api_id    = aws_apigatewayv2_api.api_gateway.id
  route_key = "POST /requests/{user}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# Create a stage
resource "aws_apigatewayv2_stage" "dev_stage" {
  api_id      = aws_apigatewayv2_api.api_gateway.id
  name        = "dev"
  auto_deploy = true
}

# Output information about the API gateway
output "api_gateway_exec_arn" { value = aws_apigatewayv2_api.api_gateway.execution_arn }
output "api_gateway_arn" { value = aws_apigatewayv2_api.api_gateway.arn }
output "api_gateway_id" { value = aws_apigatewayv2_api.api_gateway.id }
output "api_gateway_endpoint" { value = aws_apigatewayv2_api.api_gateway.api_endpoint }