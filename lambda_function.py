import json
import boto3
import os

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    bucket_name = os.getenv('S3_BUCKET', 'host-static-web-app-cdn-1')  
    object_key = 'index.html'
    
    try:
        s3_object = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        html_content = s3_object['Body'].read().decode('utf-8')
        
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'text/html'
            },
            'body': html_content
        }
        
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({
                'message': 'Error retrieving index.html from S3',
                'error': str(e)
            })
        }
