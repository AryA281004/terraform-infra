
# ============================================================
# MONGODB EC2
# ============================================================
# Self-managed MongoDB running on a private EC2 instance.
# Credentials are stored externally in AWS Secrets Manager.
# MongoDB is accessible only from the backend ECS security group.
# ============================================================

module "mongodb" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//mongo_ec2?ref=v2.0.2"

  # ----------------------------------------------------------
  # ENVIRONMENT
  # ----------------------------------------------------------

  environment  = var.environment
  project_name = local.project_name

  # ----------------------------------------------------------
  # NETWORK
  # ----------------------------------------------------------

  vpc_id = module.vpc.vpc_id

  private_subnet_id = module.vpc.private_subnet_ids["private_subnet_1a"]

  backend_security_group_id = module.vpc.security_group_ids["container-sg"]

  # ----------------------------------------------------------
  # INSTANCE
  # ----------------------------------------------------------

  instance_type = "t3.small"

  # ----------------------------------------------------------
  # STORAGE
  # ----------------------------------------------------------

  root_volume_size     = 20
  database_volume_size = 30

  # ----------------------------------------------------------
  # DATABASE
  # ----------------------------------------------------------

  database_name = "neonlens"

  # ----------------------------------------------------------
  # CREDENTIALS
  # ----------------------------------------------------------

  secret_arn = var.mongodb_secret_arn

  # ----------------------------------------------------------
  # TAGS
  # ----------------------------------------------------------

  tags = local.common_tags
}
