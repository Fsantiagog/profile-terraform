
resource "aws_s3_bucket" "profile_site" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name = "${var.bucket_name}-s3"
    Environment = var.environment
    Owner = "felipe.fsantiagogbea@gmail.com"
    Team = "DevOps"
    Project = "Profile"
  }
}

resource "aws_s3_bucket_website_configuration" "profile_site" {
  bucket = aws_s3_bucket.profile_site.id
    index_document {
        suffix = "index.html"
    }
    error_document {
        key = "error.html"
    }
}

output "s3_bucket_website_name" {
  value = aws_s3_bucket.profile_site.id
}

output "s3_website_endpoint" {
  value = aws_s3_bucket.profile_site.website_endpoint
}
