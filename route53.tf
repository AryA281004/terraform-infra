# ============================================================
# ROUTE 53
# ============================================================

module "route53" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//route53?ref=main"

  environment = var.environment
  name        = var.project_name

  domain_name = var.domain_name

  record_name = var.record_name

  zone_id = data.aws_route53_zone.this.zone_id

  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id

  evaluate_target_health = true

  allow_overwrite = false

  records = {
    backend = {
      name = var.record_name
      type = "A"

      alias = {
        dns_name               = module.alb.alb_dns_name
        zone_id                = module.alb.alb_zone_id
        evaluate_target_health = true
      }
    }
  }

  tags = local.common_tags
}


# ============================================================
# EXISTING HOSTED ZONE
# ============================================================

data "aws_route53_zone" "neonlens" {
  name         = var.domain_name
  private_zone = false
}