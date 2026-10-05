data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # ==========================================================
  # ENVIRONMENT
  # ==========================================================
  # default workspace = no environment
  # dev/pre/prod workspaces = corresponding environment

  environment = terraform.workspace == "default" ? null : terraform.workspace

  # ==========================================================
  # AWS REGION BY TERRAFORM WORKSPACE
  # ==========================================================

  aws_region = {
    dev  = "eu-west-1"
    pre  = "us-east-2"
    prod = "us-east-1"
  }

  azs = {
    dev  = slice(data.aws_availability_zones.available.names, 0, 3)
    pre  = slice(data.aws_availability_zones.available.names, 0, 3)
    prod = slice(data.aws_availability_zones.available.names, 0, 3)
  }

  # ==========================================================
  # PROJECT
  # ==========================================================

  project_name = var.project_name != null ? var.project_name : "neonlens"

  # ==========================================================
  # COMMON TAGS
  # ==========================================================

  common_tags = {
    Project   = local.project_name
    ManagedBy = "Terraform"
  }

  # ==========================================================
  # ENVIRONMENT TAGS
  # ==========================================================
  # default = {}
  # dev/pre/prod = { Environment = "<workspace>" }

  environment_tags = local.environment == null ? {} : {
    Environment = local.environment
  }

  # ==========================================================
  # VPC / SECURITY GROUPS
  # ==========================================================

  alb_security_group_id = module.vpc.security_group_ids["alb-sg"]

  container_security_group_id = module.vpc.security_group_ids["container-sg"]

  # ==========================================================
  # ALB SUBNETS
  # ==========================================================

  alb_subnet_ids = [
    module.vpc.public_subnet_ids["public_subnet_1a"],
    module.vpc.public_subnet_ids["public_subnet_1b"],
    module.vpc.public_subnet_ids["public_subnet_1c"]
  ]

  # ==========================================================
  # ECS SUBNETS
  # ==========================================================

  ecs_subnet_ids = [
    module.vpc.private_subnet_ids["private_subnet_1a"],
    module.vpc.private_subnet_ids["private_subnet_1b"],
    module.vpc.private_subnet_ids["private_subnet_1c"]
  ]

  # ==========================================================
  # FRONTEND
  # ==========================================================

  frontend_aliases = (
    var.frontend_domain != null
    ? [var.frontend_domain]
    : []
  )

  # ==========================================================
  # ALB HTTPS
  # ==========================================================

  alb_https_enabled = var.acm_certificate_arn != null

  # ==========================================================
  # CLOUDFRONT
  # ==========================================================
  # AWS managed CloudFront CachingOptimized policy.

  cloudfront_cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"

  # ==========================================================
  # CLOUDWATCH - ALB
  # ==========================================================

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