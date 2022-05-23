####################################
# Create S3
###################################
resource "aws_s3_bucket" "backend" {
  bucket = "${var.app-name}-backend"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = var.app-name
    Environment = var.app-environment
  }
}