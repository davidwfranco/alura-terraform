resource "aws_s3_bucket" "david_dev_4" {
  provider = aws.us-east-2
  bucket = "tf-test-david-dev-4"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "david_dev"
  }
}