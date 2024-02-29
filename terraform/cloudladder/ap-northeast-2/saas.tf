data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "cloudwave-cloudladder-tfstate"
    key = "global/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

data "archive_file" "personalize_lambda" {
  type        = "zip"
  source_file = "personalize_lambda.py"
  output_path = "personalize_lambda.zip"
}

data "archive_file" "connect_lambda" {
  type        = "zip"
  source_file = "connect_lambda.py"
  output_path = "connect_lambda.zip"
}

resource "aws_lambda_function" "personalize_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "personalize_lambda.zip"
  function_name = "personalize_lambda"
  role          = data.terraform_remote_state.infra.outputs.iam_for_lambda
  handler       = "index.test"

  source_code_hash = data.archive_file.personalize_lambda.output_base64sha256

  runtime = "python3.8"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

resource "aws_lambda_function" "connect_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "connect_lambda.zip"
  function_name = "connect_lambda"
  role          = data.terraform_remote_state.infra.outputs.iam_for_lambda
  handler       = "index.test"

  source_code_hash = data.archive_file.connect_lambda.output_base64sha256

  runtime = "python3.8"

  environment {
    variables = {
      foo = "bar"
    }
  }
}