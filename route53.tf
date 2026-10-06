# ============================================================
# ROUTE 53
# ============================================================

locals {
  # AWS-owned hosted zone ID for all CloudFront distributions.
  hosted_zone_id = "Z00242593S927K24D94XL"
}

# Set to true only if the ALB is configured as dualstack.
variable "enable_alb_ipv6" {
  type    = bool
  default = false
}

# ============================================================
# EXISTING HOSTED ZONE
# ============================================================

# The hosted zone must already exist in Route 53 and must be
# a public hosted zone for var.domain_name.
data "aws_route53_zone" "neonlens" {
  name         = var.domain_name
  private_zone = false
}

# ============================================================
# ROUTE 53 RECORDS
# ============================================================

module "route53" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//route53?ref=v1.3.0"

  environment = local.environment
  name        = var.project_name

  # Required by the Route 53 module.
  domain_name = var.domain_name

  # Existing hosted zone.
  zone_id = data.aws_route53_zone.neonlens.zone_id

  allow_overwrite = false

  records = merge(

    {
      # --------------------------------------------------------
      # FRONTEND
      # aryandudhat.qd.je
      # -> CloudFront
      # --------------------------------------------------------

      frontend = {
        name = var.frontend_domain
        type = "A"

        alias = {
          dns_name               = module.s3.cloudfront_domain_name
          zone_id                = "Z2FDTNDATAQYW2"
          evaluate_target_health = false
        }
      }

      # --------------------------------------------------------
      # BACKEND
      # api.aryandudhat.qd.je
      # -> Application Load Balancer
      # --------------------------------------------------------

      backend = {
        name = var.backend_domain
        type = "A"

        alias = {
          dns_name               = module.alb.alb_dns_name
          zone_id                = module.alb.alb_zone_id
          evaluate_target_health = true
        }
      }
    },

    # ----------------------------------------------------------
    # BACKEND IPv6
    # Only create this if the ALB uses dualstack.
    # ----------------------------------------------------------


  )

  tags = local.common_tags
}