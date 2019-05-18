# Lambda to s3
This lambda function downloads a file from a URL to a bucket, both values are provided as part of the event data:
```
{
  "url":"url_path"
  "bucket":"bucket_name"
}
```
Terraform code is also included to allow for easy deployment, I recommend using [aws-vault](https://github.com/99designs/aws-vault) to provide your credentials.