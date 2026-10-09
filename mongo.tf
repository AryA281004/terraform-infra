# ============================================================
# MONGODB ATLAS VPC PEERING
# ============================================================

module "mongodb_peering" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//mongo_peering?ref=v1.4.5"

  depends_on = [module.vpc]
  # ----------------------------------------------------------
  # MongoDB Atlas
  # ----------------------------------------------------------

  project_id = var.mongodb_atlas_project_id

  atlas_region   = var.mongodb_atlas_region
  atlas_vpc_cidr = var.mongodb_atlas_vpc_cidr

  # ----------------------------------------------------------
  # AWS
  # ----------------------------------------------------------

  aws_account_id = var.aws_account_id

  aws_region = var.aws_region

  aws_vpc_id = module.vpc.vpc_id

  aws_vpc_cidr = var.vpc_cidr

  # ----------------------------------------------------------
  # AWS private route tables
  # ----------------------------------------------------------

  private_route_table_ids = values(module.vpc.private_route_table_ids)

  # ----------------------------------------------------------
  # Metadata
  # ----------------------------------------------------------

  environment = var.environment

  tags = local.common_tags
}