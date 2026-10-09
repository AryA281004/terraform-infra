container_environment = {
  NODE_ENV = "production"
  PORT     = 3000
}

vpc_cidr = "10.30.0.0/16"

public_subnet_cidr = {
  public_subnet_1a = {
    cidr_block = "10.30.1.0/24"
    az         = "us-east-1a"
  }

  public_subnet_1b = {
    cidr_block = "10.30.2.0/24"
    az         = "us-east-1b"
  }

  public_subnet_1c = {
    cidr_block = "10.30.3.0/24"
    az         = "us-east-1c"
  }
}

private_subnet_cidr = {
  private_subnet_1a = {
    cidr_block      = "10.30.11.0/24"
    az              = "us-east-1a"
    nat_gateway_key = "public_subnet_1a"
  }

  private_subnet_1b = {
    cidr_block      = "10.30.12.0/24"
    az              = "us-east-1b"
    nat_gateway_key = "public_subnet_1b"
  }

  private_subnet_1c = {
    cidr_block      = "10.30.13.0/24"
    az              = "us-east-1c"
    nat_gateway_key = "public_subnet_1c"
  }
}

aws_region = "us-east-1"

aws_account_id = "666729139368"

container_image = "666729139368.dkr.ecr.us-east-1.amazonaws.com/neon-lens-backend:latest"


frontend_domain = "neonlens.aryandudhat.qd.je"
backend_domain  = "api.aryandudhat.qd.je"

# ============================================================
# BACKEND SECRETS
# ============================================================
container_secrets = {

  FRONTEND_URL = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:FRONTEND_URL::"

  MONGO_URI = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:MONGO_URI::"

  REDIS_HOST = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:REDIS_HOST::"

  REDIS_PASSWORD = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:REDIS_PASSWORD::"

  REDIS_PORT = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:REDIS_PORT::"

  JWT_ACCESS_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:JWT_ACCESS_SECRET::"

  JWT_REFRESH_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:JWT_REFRESH_SECRET::"

  CLIENT_ID = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:CLIENT_ID::"

  CLIENT_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:CLIENT_SECRET::"

  REFRESH_TOKEN = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:REFRESH_TOKEN::"

  EMAIL_USER = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:EMAIL_USER::"

  CLOUDINARY_CLOUD_NAME = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:CLOUDINARY_CLOUD_NAME::"

  CLOUDINARY_API_KEY = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:CLOUDINARY_API_KEY::"

  CLOUDINARY_API_SECRET = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:CLOUDINARY_API_SECRET::"

  IMAGEKIT_PUBLIC_KEY = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:IMAGEKIT_PUBLIC_KEY::"

  IMAGEKIT_PRIVATE_KEY = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:IMAGEKIT_PRIVATE_KEY::"

  IMAGEKIT_URL_ENDPOINT = "arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK:IMAGEKIT_URL_ENDPOINT::"
}

execution_secret_arns = ["arn:aws:secretsmanager:us-east-1:666729139368:secret:prod/neonlens/backend-W8TGOK*"]




acm_certificate_arn = "arn:aws:acm:us-east-1:666729139368:certificate/d8ef7687-8ba6-4530-919e-fbcef8ea27a1"



frontend_acm_certificate_arn = "arn:aws:acm:us-east-1:666729139368:certificate/d8ef7687-8ba6-4530-919e-fbcef8ea27a1"



host_header_values = [
  "api.aryandudhat.qd.je"
]