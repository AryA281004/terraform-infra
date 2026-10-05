container_environment = {
  NODE_ENV = "development"
  PORT     = 3000
}

container_image = "666729139368.dkr.ecr.eu-west-1.amazonaws.com/neon-lens-backend:latest"


frontend_domain = "dev.neonlens.aryandudhat.qd.je"
backend_domain  = "dev.api.aryandudhat.qd.je"

acm_certificate_arn = "arn:aws:acm:eu-west-1:666729139368:certificate/c541aa8e-86bc-492f-8ee9-1035125ad70d"

frontend_acm_certificate_arn = "arn:aws:acm:eu-west-1:666729139368:certificate/c541aa8e-86bc-492f-8ee9-1035125ad70d"

host_header_values = [
  "dev.api.aryandudhat.qd.je"
]


# ============================================================
# BACKEND SECRETS
# ============================================================
container_secrets = {

  FRONTEND_URL = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:FRONTEND_URL::"

  MONGO_URI = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:MONGO_URI::"

  REDIS_HOST = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:REDIS_HOST::"

  REDIS_PASSWORD = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:REDIS_PASSWORD::"

  REDIS_PORT = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:REDIS_PORT::"

  JWT_ACCESS_SECRET = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:JWT_ACCESS_SECRET::"

  JWT_REFRESH_SECRET = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:JWT_REFRESH_SECRET::"

  CLIENT_ID = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:CLIENT_ID::"

  CLIENT_SECRET = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:CLIENT_SECRET::"

  REFRESH_TOKEN = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:REFRESH_TOKEN::"

  EMAIL_USER = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:EMAIL_USER::"

  CLOUDINARY_CLOUD_NAME = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:CLOUDINARY_CLOUD_NAME::"

  CLOUDINARY_API_KEY = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:CLOUDINARY_API_KEY::"

  CLOUDINARY_API_SECRET = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:CLOUDINARY_API_SECRET::"

  IMAGEKIT_PUBLIC_KEY = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:IMAGEKIT_PUBLIC_KEY::"

  IMAGEKIT_PRIVATE_KEY = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:IMAGEKIT_PRIVATE_KEY::"

  IMAGEKIT_URL_ENDPOINT = "arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b:IMAGEKIT_URL_ENDPOINT::"
}

execution_secret_arns = ["arn:aws:secretsmanager:eu-west-1:666729139368:secret:dev/neonlens/backend-2j7C2b*"]