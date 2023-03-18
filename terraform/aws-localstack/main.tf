provider "aws" {
  region                      = "ap-south-1"
  profile                     = "test-profile"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam      = "http://localhost:4566"
    s3       = "http://s3.localhost.localstack.cloud:4566"
    dynamodb = "http://localhost:4566"
  }

}
###########################################################################################
## S3 buckets are non-persistent in the free version of localstack. So the state file will
## get delete when the localstack container restarts. So commenting out below section
###########################################################################################
#terraform {
#
#  backend "s3" {
#    bucket                      = "tf-state-bucket"
#    key                         = "aws-localstack/terraform.tfstate"
#    profile                     = "test-profile"
#    region                      = "ap-south-1"
#    dynamodb_table              = "tf-state-locking"
#    skip_credentials_validation = true
#    skip_metadata_api_check     = true
#    force_path_style            = true    #This is important for localstack
#    dynamodb_endpoint           = "http://localhost:4566"
#    #This is important for localstack. This means we can save state file to different db in different account having different url
#    endpoint                    = "http://localhost:4566"
#    #This is important for localstack. This means we can save state file to different account having different url
#  }
#
#}
