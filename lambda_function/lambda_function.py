import json
import requests

def lambda_handler(event, context):
    
    requests_version = requests.__version__
    return {
        'statusCode': 200,
        'body': json.dumps({'message': 'Hello from Lambda!', 'requests_version': requests_version})
    }
