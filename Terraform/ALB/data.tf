resource "aws_s3_bucket_policy" "b" {
  bucket  = "terraform-suyog"
  
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::terraform-suyog/*"
    }
  ]
}
POLICY
}