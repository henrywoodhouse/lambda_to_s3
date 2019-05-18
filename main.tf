resource "aws_iam_role" "lambda_to_s3" {
  name = "lambda_to_s3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3_policy" {
  role       = "${aws_iam_role.lambda_to_s3.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "url_to_s3" {
  filename      = "lambda.zip"
  function_name = "lambda_function"
  role          = "${aws_iam_role.lambda_to_s3.arn}"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.7"
  memory_size   = "${var.lambda_memory}"
  timeout       = "${var.timeout}"
}
