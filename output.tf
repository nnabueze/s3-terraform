output "s3-bucket-name" {
  value = aws_s3_bucket.backend.bucket_domain_name
}