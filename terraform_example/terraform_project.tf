# 1️ Define AWS Provider
provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

# 2️ Create an S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-12345"  # Change to a unique bucket name
}

# 3️ Enable Versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 4️ Set Public Access Block (Optional)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 5 Output Bucket Name
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
