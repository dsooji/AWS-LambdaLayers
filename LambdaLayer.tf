resource "aws_lambda_layer_version" "lambda_layer" {
  filename   = "${path.module}/Modules/requests.zip"
  layer_name = "requestmodulelayer-tf"

  compatible_runtimes = ["python3.12"]
}