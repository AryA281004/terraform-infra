# ============================================================
# FRONTEND S3 + CLOUDFRONT
# ============================================================

module "s3" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//s3?ref=main"

  environment = var.environment
  name        = var.project_name

  bucket_name = var.frontend_bucket_name

  force_destroy = false

  enable_versioning = true

  sse_algorithm = "AES256"

  noncurrent_version_expiration_days = 30

  abort_incomplete_multipart_upload_days = 7

  # ----------------------------------------------------------
  # S3 CLOUDWATCH
  # ----------------------------------------------------------

  enable_cloudwatch_alarms = true

  bucket_size_alarm_threshold_gb = 100

  object_count_alarm_threshold = 1000000

  # ----------------------------------------------------------
  # SNS
  # ----------------------------------------------------------

  enable_sns_notifications = var.notification_email != null

  notification_email = var.notification_email

  # ----------------------------------------------------------
  # CLOUDFRONT
  # ----------------------------------------------------------

  default_root_object = "index.html"

  price_class = "PriceClass_100"

  aliases = local.frontend_aliases

  acm_certificate_arn = var.frontend_acm_certificate_arn

  # AWS Managed CachingOptimized policy.
  cache_policy_id = local.cloudfront_cache_policy_id

  origin_request_policy_id = null

  # SPA routing.
  custom_error_responses = [
    {
      error_code            = 403
      response_code         = 200
      response_page_path    = "/index.html"
      error_caching_min_ttl = 0
    },
    {
      error_code            = 404
      response_code         = 200
      response_page_path    = "/index.html"
      error_caching_min_ttl = 0
    }
  ]

  geo_restriction_type      = "none"
  geo_restriction_locations = []

  enable_cloudfront_logging = false

  wait_for_deployment = true

  tags = local.common_tags
}