## Start localstack

Make sure docker and docker-compose is installed. To run the localstack docker image, go to the docker folder in this
repository and run the command: <br>`docker compose up -d`

> ### If `docker compose` does not work<br>
> Verify that the colima daemon is running `colima status/start`.<p>
> Ensure docker-compose softlink is present in ~/.docker/cli-plugins. Create folder if not present.<br>`mkdir -p ~/.docker/cli-plugins/docker-compose`<p>
> Create softlink if not present.<br>`ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose`<br>

> ### Pre-requisite for using localstack services:<br>
>Run `aws configure` command to create localstack credentials. Localstack requires that these credentials are present, but it does not validates them.

For testing purpose created *test-profile* using `aws configure --profile test-profile` command.

## S3 examples using AWS CLI

### Create s3 bucket

`aws --profile test-profile --endpoint-url=http://localhost:4566 s3 mb s3://demo-bucket`

### List objects in s3 bucket

`aws --profile test-profile --endpoint-url=http://localhost:4566 s3 ls s3://demo-bucket`

### Copy file in s3 bucket

`aws --profile test-profile --endpoint-url=http://localhost:4566 s3 cp <local-file> s3://demo-bucket`
