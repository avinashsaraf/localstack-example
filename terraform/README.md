## Terraform variables

By default, terraform reads the variable values from `terraform.tfvars`. But if we have any other file name we pass it along with the commands
<br> `terraform plan -var-file=my-vars.tfvars` <br> `terraform apply -var-file=my-vars.tfvars`

## Terraform remote state

1. Create a bucket before running terraform apply in aws-localstack using below command. This bucket is used to save terraform state remotely.
   <br> `aws --profile test-profile --endpoint-url=http://localhost:4566 s3api create-bucket --bucket tf-state-bucket --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
   `
2. Create dynamodb table for tf state locking using command:
   <br> `aws --profile test-profile --endpoint-url=http://localhost:4566 dynamodb create-table --table-name tf-state-locking --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=1 --region ap-south-1 --query TableDescription.TableArn --output text`

***Note**: The S3 buckets are non-persistent in the free version of localstack. So the state file gets deleted when the localstack container restarts. Hence the
backend section in main.tf is commented out. To test the remote state, uncomment the section and run `terraform init` and then `terraform apply` command. Verify
the file created in the S3 bucket.*

## Terraform EC2

Go through aws-ec2.tf terraform file how to configure ec2 using terraform<p>
_**Note**: EC2 instance in localstack are dummy instances, so it won't be available for ssh and all. It is suitable for testing of terraform apply/destroy use
case on ec2._
