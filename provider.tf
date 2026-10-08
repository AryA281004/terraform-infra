provider "aws" {
  region = lookup(
    local.aws_region,
    terraform.workspace
  )

  default_tags {
    tags = merge(
      local.common_tags,
      local.environment_tags

    )
  }
}

provider "mongodbatlas" {
  public_key  = var.mongodb_atlas_public_key
  private_key = var.mongodb_atlas_private_key
}