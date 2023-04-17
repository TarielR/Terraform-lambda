resource "aws_lambda_function" "this" {
  filename      = "lambda_function_payload.zip"
  function_name = "cdisney_mok"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda.run"

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime = "python3.9"

  tags    = var.tags
}

resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "lambda.py"
  output_path = "lambda_function_payload.zip"
}


#--------------- Lambda IAM Permissions
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  tags               = var.tags
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
