resource "aws_api_gateway_rest_api" "MyAPI" {
  name        = "MyAPI"
  description = "My API Gateway"
}

resource "aws_api_gateway_resource" "MyAPIResource" {
  rest_api_id = aws_api_gateway_rest_api.MyAPI.id
  parent_id   = aws_api_gateway_rest_api.MyAPI.root_resource_id
  path_part   = "compute"
}

resource "aws_api_gateway_deployment" "api_deployment" {
  depends_on = [aws_api_gateway_integration.MyAPIIntegration]
  rest_api_id = aws_api_gateway_rest_api.MyAPI.id
  stage_name  = "Dev"
}

resource "aws_api_gateway_method" "MyAPIMethod" {
  rest_api_id   = aws_api_gateway_rest_api.MyAPI.id
  resource_id   = aws_api_gateway_resource.MyAPIResource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "MyAPIIntegration" {
  rest_api_id = aws_api_gateway_rest_api.MyAPI.id
  resource_id = aws_api_gateway_resource.MyAPIResource.id
  http_method = aws_api_gateway_method.MyAPIMethod.http_method
  type        = "AWS_PROXY"
  
  integration_http_method = "POST"
  uri                     = aws_lambda_function.api_lambda.invoke_arn
}

resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.MyAPI.execution_arn}/*/*"
}