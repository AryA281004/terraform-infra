# ============================================================
# COMMON LOCALS
# ============================================================

locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }

  alb_security_group_id = module.vpc.security_group_ids["alb-sg"]

  container_security_group_id = module.vpc.security_group_ids["container-sg"]

  alb_subnet_ids = [
    module.vpc.public_subnet_ids["public_subnet_1a"],
    module.vpc.public_subnet_ids["public_subnet_1b"]
  ]

  ecs_subnet_ids = [
    module.vpc.private_subnet_ids["private_subnet_1a"],
    module.vpc.private_subnet_ids["private_subnet_1b"]
  ]

  frontend_aliases = (
    var.frontend_domain != null
    ? [var.frontend_domain]
    : []
  )

  alb_https_enabled = var.acm_certificate_arn != null

  # AWS managed CloudFront CachingOptimized policy.
  cloudfront_cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"

  # ALB ARN suffix required by CloudWatch ApplicationELB metrics.
  load_balancer_arn_suffix = split(
    "loadbalancer/",
    module.alb.alb_arn
  )[1]

  # Target group ARN suffix required by CloudWatch ApplicationELB metrics.
  target_group_arn_suffix = split(
    ":",
    module.alb.target_group_arn
  )[5]
}