resource "aws_lambda_layer_version" "lambda_layer" {
  s3_bucket         = "deepen-s3-bucket"
  s3_key            = "dependencies.zip"
  layer_name        = "requestmodulelayer-tf"
  compatible_runtimes = ["python3.12"]
}
