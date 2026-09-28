# ============================================================
# ROUTE 53
# ============================================================

locals {
  # Fixed, AWS-owned hosted zone ID for ALL CloudFront distributions.
  # https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html
  cloudfront_hosted_zone_id = "Z00242593S927K24D94XL"
}

# Set to true only if the ALB's ip_address_type is "dualstack".
# An AAAA alias to an IPv4-only ALB will resolve but fail to connect.
variable "enable_alb_ipv6" {
  type    = bool
  default = false
}

module "route53" {
  # Pinned. Replace v1.0.0 with a real tag or commit SHA from the module repo.
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//route53?ref=v1.0.0"

  environment = var.environment
  name        = var.project_name

  zone_id = data.aws_route53_zone.neonlens.zone_id

  allow_overwrite = false

  records = merge(
    {
      # ----------------------------------------------------------
      # FRONTEND -> CloudFront (IPv4 + IPv6)
      # ----------------------------------------------------------
      frontend = {
        name = var.frontend_domain
        type = "A"

        alias = {
          dns_name               = module.s3.cloudfront_domain_name
          zone_id                = local.cloudfront_hosted_zone_id
          evaluate_target_health = false # must be false for CloudFront
        }
      }

      frontend_ipv6 = {
        name = var.frontend_domain
        type = "AAAA"

        alias = {
          dns_name               = module.s3.cloudfront_domain_name
          zone_id                = local.cloudfront_hosted_zone_id
          evaluate_target_health = false
        }
      }

      # ----------------------------------------------------------
      # BACKEND -> ALB (IPv4)
      # ----------------------------------------------------------
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
    # BACKEND -> ALB (IPv6), only when the ALB is dualstack
    # ----------------------------------------------------------
    var.enable_alb_ipv6 ? {
      backend_ipv6 = {
        name = var.backend_domain
        type = "AAAA"

        alias = {
          dns_name               = module.alb.alb_dns_name
          zone_id                = module.alb.alb_zone_id
          evaluate_target_health = true
        }
      }
    } : {}
  )

  tags = local.common_tags
}

# ============================================================
# EXISTING HOSTED ZONE
# ============================================================

# Must be a PUBLIC zone in this account whose name exactly matches
# var.domain_name (aryandudhat.qd.je), with the registrar/parent
# NS records pointing at this zone's nameservers.
data "aws_route53_zone" "neonlens" {
  name         = var.domain_name
  private_zone = false
}
