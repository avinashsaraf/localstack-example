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

resource "aws_iam_group" "s3-sample-user-group" {
  name = "s3-sample-user-group"
}

resource "aws_s3_bucket_policy" "sample-group-bucket-policy" {
  bucket = aws_s3_bucket.create-sample-bucket.id
  policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Aciton": "*",
              "Effect": "Allow",
              "Resource": "arn:aws:s3:::${aws_s3_bucket.create-sample-bucket.id}/*",
              "Principal":{
                  "AWS":[
                      "${aws_iam_group.s3-sample-user-group.arn}"
                  ]
              }
          }
      ]
  }
  EOF
}
