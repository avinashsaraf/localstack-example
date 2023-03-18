provider "aws" {
  region                      = "ap-south-1"
  profile                     = "test-profile"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam = "http://localhost:4566"
    s3  = "http://s3.localhost.localstack.cloud:4566"
  }

}
