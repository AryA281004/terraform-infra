# ============================================================
# APPLICATION LOAD BALANCER
# ============================================================

module "alb" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//alb?ref=main"

  environment = var.environment
  name        = var.project_name

  vpc_id = module.vpc.vpc_id

  alb_subnet_ids = [
    module.vpc.public_subnet_ids["public_subnet_1a"],
    module.vpc.public_subnet_ids["public_subnet_1b"]
  ]

  alb_security_group_id = module.vpc.security_group_ids["alb-sg"]

  service_security_group_id = module.vpc.security_group_ids["container-sg"]

  internal_load_balancer = false

  enable_alb_deletion_protection = false

  enable_http_listener  = true
  enable_https_listener = local.alb_https_enabled

  acm_certificate_arn = var.acm_certificate_arn

  container_port = var.container_port

  target_group_protocol = "HTTP"

  health_check_path     = "/health"
  health_check_protocol = "HTTP"
  health_check_matcher  = "200-399"

  health_check_interval = 30
  health_check_timeout  = 5

  healthy_threshold   = 2
  unhealthy_threshold = 3

  deregistration_delay = 30

  tags = local.common_tags
}