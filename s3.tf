resource "aws_s3_bucket" "david_dev" {
  provider = aws.us-east-2
  bucket = "tf-test-david-dev"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "david_dev"
  }
}