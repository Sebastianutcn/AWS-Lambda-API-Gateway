# AWS-Lambda-API-Gateway
This repository contains Terraform scripts to deploy an AWS Lambda function with API Gateway, performing a simple computation via a GET request.

**Files:**
1. [`lambda.tf`](https://github.com/Sebastianutcn/AWS-Lambda-API-Gateway/blob/main/lambda.tf) defines the configuration for deploying an AWS Lambda function, including its role, handler, runtime, and any necessary permissions.
2. [`rest_api.tf`](https://github.com/Sebastianutcn/AWS-Lambda-API-Gateway/blob/main/rest_api.tf) configures an API Gateway REST API, specifying resources, methods, integrations, and deployment settings to expose the Lambda function via HTTP endpoints.
3. [`provider.tf`](https://github.com/Sebastianutcn/AWS-Lambda-API-Gateway/blob/main/provider.tf) is used to configure the provider.
4. [`output.tf`](https://github.com/Sebastianutcn/AWS-Lambda-API-Gateway/blob/main/output.tf) provides the API Gateway's invoke URL after deployment.
5. [`lambda_function.py`](https://github.com/Sebastianutcn/AWS-Lambda-API-Gateway/blob/main/lambda_function.py) contains the code for the AWS Lambda function.
6. [`lambda.zip`](https://github.com/Sebastianutcn/CloudFront-CDN/blob/main/src/lambda.zip) is the deployment package for the AWS Lambda function.

## Installation
- Terraform command to initialize the project
```
terraform init
```
* Terraform command to plan the changes and to check again the resources that were added, changed or deleted
```
terraform plan -out plan.out
```
- Terraform command to apply the changes
```
terraform apply plan.out --auto-approve
```


