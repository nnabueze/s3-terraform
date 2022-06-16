####################################
# Create S3
###################################
resource "aws_s3_bucket" "backend" {
  bucket = var.app-name
  acl    = "private"

  tags = {
    Name        = var.app-name
    Environment = var.app-environment
  }
}