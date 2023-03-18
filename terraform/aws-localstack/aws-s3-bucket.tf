resource "aws_s3_bucket" "create-sample-bucket" {
  bucket = "sample-bucket"
  tags   = {
    description = "A sample bucket in localstack"
  }
}

output "sample-bucket-arn" {
  value = aws_s3_bucket.create-sample-bucket.arn
}
