resource "aws_s3_bucket_policy" "b" {
  bucket  = "terraform-suyog"
  region = "us-east-1"
  
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "arn:aws:iam::645928594964:root",
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::terraform-suyog/*"
    }
  ]
}
POLICY
}