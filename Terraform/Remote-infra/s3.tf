resource "aws_s3_bucket" "remote_s3" {
  bucket = "state_bucket"

  tags = {
    Name = "state_bucket"
    Environment = "dev"
  }
}