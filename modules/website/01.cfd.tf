

resource "aws_cloudfront_distribution" "profile_distribution" {
  enabled = true
  default_root_object = "index.html"

  origin {
    domain_name = "${var.bucket_name}.s3.amazonaws.com"
    origin_id   = "S3-${var.bucket_name}"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.profile_oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id       = "S3-${var.bucket_name}"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "CloudFront-${var.bucket_name}"
    Environment = var.environment
    Owner = "felipe.fsantiagogbea@gmail.com"
    Team = "DevOps"
    Project = "Profile"
  }
}

resource "aws_cloudfront_origin_access_identity" "profile_oai" {
    comment = "OAI for ${var.bucket_name}"
}

resource "aws_s3_bucket_policy" "allow_cloudfront_access" {
    bucket = var.bucket_name
    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
              Sid = "AllowCloudFrontServicePrincipalReadOnly",
              Effect = "Allow",
              Principal = {
                AWS = aws_cloudfront_origin_access_identity.profile_oai.iam_arn
              },
              Action = ["s3:GetObject"],
              Resource = "arn:aws:s3:::${var.bucket_name}/*"
            }
        ]
    })
}

output "cloudfront_url" {
  value       = aws_cloudfront_distribution.profile_distribution.domain_name
  description = "URL pública del sitio servido por CloudFront"
}