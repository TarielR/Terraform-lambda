output "lambda_arn" {
  value = aws_lambda_function.this.arn
}

output "aws_lambda_function_url_id" {
  value = aws_lambda_function_url.this.function_url
}
