# Lambda Terraform

A base project to deploy an AWS Lambda (with layer and cloudwatch logs) on AWS using terraform.

## Warnings

- You must run `create_layer_zip.sh` before running `terraform apply`
- `create_layer_zip.sh` was run using Windows Terminal with WSL (Ubuntu) inside scripts folder as sudo user `$ sudo ./create_layer_zip.sh`