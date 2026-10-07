container_environment = {
  NODE_ENV = "pre-production"
  PORT     = 3000
}

vpc_cidr = "20.0.0.0/16"

aws_region = "us-east-2"

aws_account_id = "666729139368"

container_image = "666729139368.dkr.ecr.us-east-2.amazonaws.com/neon-lens-backend:latest"



frontend_domain = "pre-neonlens.aryandudhat.qd.je"
backend_domain  = "pre-api.aryandudhat.qd.je"

acm_certificate_arn = "arn:aws:acm:us-east-2:666729139368:certificate/e47202a8-4ae1-41fd-83f0-444d7f1d27a2"

frontend_acm_certificate_arn = "arn:aws:acm:us-east-1:666729139368:certificate/d8ef7687-8ba6-4530-919e-fbcef8ea27a1"

host_header_values = [
  "pre-api.aryandudhat.qd.je"
]

# ============================================================
# BACKEND SECRETS
# ============================================================
container_secrets = {

  FRONTEND_URL = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:FRONTEND_URL::"

  MONGO_URI = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:MONGO_URI::"

  REDIS_HOST = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:REDIS_HOST::"

  REDIS_PASSWORD = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:REDIS_PASSWORD::"

  REDIS_PORT = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:REDIS_PORT::"

  JWT_ACCESS_SECRET = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:JWT_ACCESS_SECRET::"

  JWT_REFRESH_SECRET = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:JWT_REFRESH_SECRET::"

  CLIENT_ID = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:CLIENT_ID::"

  CLIENT_SECRET = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:CLIENT_SECRET::"

  REFRESH_TOKEN = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:REFRESH_TOKEN::"

  EMAIL_USER = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:EMAIL_USER::"

  CLOUDINARY_CLOUD_NAME = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:CLOUDINARY_CLOUD_NAME::"

  CLOUDINARY_API_KEY = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:CLOUDINARY_API_KEY::"

  CLOUDINARY_API_SECRET = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:CLOUDINARY_API_SECRET::"

  IMAGEKIT_PUBLIC_KEY = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:IMAGEKIT_PUBLIC_KEY::"

  IMAGEKIT_PRIVATE_KEY = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:IMAGEKIT_PRIVATE_KEY::"

  IMAGEKIT_URL_ENDPOINT = "arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj:IMAGEKIT_URL_ENDPOINT::"
}

execution_secret_arns = ["arn:aws:secretsmanager:us-east-2:666729139368:secret:pre/neonlens/backend-nEJgNj*"]