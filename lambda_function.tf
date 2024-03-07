resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}


resource "aws_lambda_function" "lambda_function" {
  function_name    = "S3LambdaFunction-tf"
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"
  filename         = "lambda_function/lambda_function.zip"
  role             = aws_iam_role.lambda_role.arn
  timeout          = 30
  memory_size      = 128
  layers = [aws_lambda_layer_version.lambda_layer.arn]

    environment {
    variables = {
      PYTHONPATH = "/opt"
    }
  }
}


