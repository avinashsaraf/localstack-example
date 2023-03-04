##Start localstack
Make sure docker and docker-compose is installed.
To run the localstack docker image, go to the docker folder and run the command: <br>
`docker compose up -d`

>###Pre-requisite before using AWS services:<br>
>Run aws configure to create some credentials. Localstack requires that these details are present, but doesn't actually validate them.

For testing purpose created *test-profile* using `aws configure` command.

##S3 examples using AWS CLI

###Create s3 bucket
`aws --profile test-profile --endpoint-url=http://localhost:4566 s3 mb s3://demo-bucket`

###List objects in s3 bucket
`aws --profile test-profile --endpoint-url=http://localhost:4566 s3 ls s3://demo-bucket`

###Copy file in s3 bucket
`aws --profile test-profile --endpoint-url=http://localhost:4566 s3 cp <local-file> s3://demo-bucket`
