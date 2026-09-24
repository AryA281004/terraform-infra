# ============================================================
# GENERAL
# ============================================================

aws_region  = "us-east-1"
environment = "dev"
project_name = "neonlens"


# ============================================================
# VPC
# ============================================================

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = {
  public_subnet_1a = {
    cidr_block = "10.0.1.0/24"
    az         = "us-east-1a"
  }

  public_subnet_1b = {
    cidr_block = "10.0.2.0/24"
    az         = "us-east-1b"
  }
}


private_subnet_cidr = {
  private_subnet_1a = {
    cidr_block      = "10.0.11.0/24"
    az              = "us-east-1a"
    nat_gateway_key = "public_subnet_1a"
  }

  private_subnet_1b = {
    cidr_block      = "10.0.12.0/24"
    az              = "us-east-1b"
    nat_gateway_key = "public_subnet_1b"
  }
}


# ============================================================
# ECS
# ============================================================

container_image = "YOUR_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/neonlens-backend:latest"

container_port = 8000

container_cpu    = 512
container_memory = 1024

task_cpu    = 512
task_memory = 1024

desired_count = 2

autoscaling_min_capacity = 2
autoscaling_max_capacity = 6


# ============================================================
# BACKEND ENVIRONMENT
# ============================================================

container_environment = {
  NODE_ENV = "production"
}


# ============================================================
# BACKEND SECRETS
# ============================================================

container_secrets = {}

execution_secret_arns = []


# ============================================================
# ROUTE 53
# ============================================================

domain_name = "YOUR_DOMAIN"

record_name = "api.YOUR_DOMAIN"


# ============================================================
# ALB HTTPS
# ============================================================

# ACM certificate must exist in us-east-1.
acm_certificate_arn = null


# ============================================================
# FRONTEND S3
# ============================================================

frontend_bucket_name = null


# ============================================================
# FRONTEND CLOUDFRONT
# ============================================================

frontend_domain = null

# CloudFront ACM certificate MUST be in us-east-1.
frontend_acm_certificate_arn = null


# ============================================================
# SNS
# ============================================================

notification_email = null