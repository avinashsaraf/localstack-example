resource "aws_s3_bucket" "create-sample-bucket" {
  bucket = "sample-bucket"
  tags   = {
    description = "A sample bucket in localstack"
  }
}

resource "aws_s3_bucket_object" "upload-sample-file" {
  bucket  = aws_s3_bucket.create-sample-bucket.id
  key     = "terraform-tf-state.backup"
  content = "./terraform-tf-state.backup"
}

output "sample-bucket-arn" {
  value = aws_s3_bucket.create-sample-bucket.arn
}
