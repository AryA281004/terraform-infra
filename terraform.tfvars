# ============================================================
# GENERAL
# ============================================================

aws_region   = "us-east-1"
environment  = "prod"
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
  public_subnet_1c = {
    cidr_block = "10.0.3.0/24"
    az         = "us-east-1c"
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

  private_subnet_1c = {
    cidr_block      = "10.0.13.0/24"
    az              = "us-east-1c"
    nat_gateway_key = "public_subnet_1c"
  }
}


# ============================================================
# ECS
# ============================================================

container_image = "666729139368.dkr.ecr.us-east-1.amazonaws.com/neon-lens-backend:latest"

container_port = 3000

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
  PORT     = 3000
}


# ============================================================
# BACKEND SECRETS
# ============================================================
container_secrets = {
  
  FRONTEND_URL = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"


  MONGO_URI = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"



  REDIS_HOST     = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  REDIS_PASSWORD = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  REDIS_PORT     = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"


  JWT_ACCESS_SECRET  = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  JWT_REFRESH_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"


  CLIENT_ID     = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  CLIENT_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"


  REFRESH_TOKEN = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  EMAIL_USER    = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"


  CLOUDINARY_CLOUD_NAME = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  CLOUDINARY_API_KEY    = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  CLOUDINARY_API_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"


  IMAGEKIT_PUBLIC_KEY   = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  IMAGEKIT_PRIVATE_KEY  = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"
  IMAGEKIT_URL_ENDPOINT = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK"

}

execution_secret_arns = ["arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK*"]


# ============================================================
# ROUTE 53
# ============================================================

# ============================================================
# ROUTE 53
# ============================================================

domain_name     = "aryandudhat.qd.je"
frontend_domain = "neonlens.aryandudhat.qd.je"
backend_domain  = "api.aryandudhat.qd.je"

# ============================================================
# ALB HTTPS
# ============================================================

# ACM certificate must exist in us-east-1.
acm_certificate_arn = "arn:aws:acm:us-east-1:666729139368:certificate/d8ef7687-8ba6-4530-919e-fbcef8ea27a1"


# ============================================================
# FRONTEND S3
# ============================================================

frontend_bucket_name = null

# CloudFront ACM certificate MUST be in us-east-1.
frontend_acm_certificate_arn = "arn:aws:acm:us-east-1:666729139368:certificate/d8ef7687-8ba6-4530-919e-fbcef8ea27a1"


# ============================================================
# SNS
# ============================================================

notification_email = null
