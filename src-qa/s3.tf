# S3 bucket for website.
resource "aws_s3_bucket" "atabek" {
  bucket = "www.${var.bucket_name}"
  acl    = "public-read"
 

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = var.common_tags
}

# S3 bucket for redirecting non-www to www.
resource "aws_s3_bucket" "atabek1" {
  bucket = var.bucket_name
  acl    = "public-read"
  

  website {
    redirect_all_requests_to = "https://www.${var.domain_name}"
  }

  tags = var.common_tags
}
