provider "aws" {
  region = lookup(
    local.aws_region,
    terraform.workspace,
    "eu-north-1"
  )

  default_tags {
    tags = merge(
      local.common_tags,
      local.environment_tags
      
    )
  }
}