# Lambda Terraform

A base project to deploy an AWS Lambda (with layer and cloudwatch logs) on AWS using terraform.

## Warnings

- You must run `create_layer_zip.sh` before running `terraform apply`
- `create_layer_zip.sh` was run using Windows Terminal with WSL (Ubuntu) inside scripts folder as sudo user `$ sudo ./create_layer_zip.sh`

## Extra

If you want to zip python dependencies manually, follow this steps:

````shell
mkdir packages
cd packages
python3 -m venv venv
source venv/bin/activate
mkdir python
cd python
# pip install pandas -t .
# pip install numpy -t .
pip install -r ../../../../app/requirements.txt -t .
rm -rf *dist-info
cd ..
zip -r my-first-lambda-package.zip python
````

### References

[Terraform - Resource: aws_lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function)

[Terraform - Resource: aws_lambda_layer_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version)

[Terraform - Resource: aws_cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)

[Add External Python Libraries to AWS Lambda using Lambda Layers](https://www.linkedin.com/pulse/add-external-python-libraries-aws-lambda-using-layers-gabe-olokun/)