import json
import botocore.vendored.requests as requests
import boto3

client = boto3.client('s3')

def write_to_s3(url, bucket):
    filename = url.split('/')[-1]
    file_data = requests.get(url).content
    client.put_object(Bucket=bucket, Key=filename, Body=file_data)
    return filename
    

def lambda_handler(event, context):
    url = event.get("url")
    bucket = event.get("bucket")

    filename = write_to_s3(url, bucket)

    return {
        'statusCode': 200,
        'body': filename + ' was succesfully downloaded to the bucket: ' + bucket
    }