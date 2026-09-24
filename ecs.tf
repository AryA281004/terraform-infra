# ============================================================
# ECS FARGATE
# ============================================================

module "ecs" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//ecs?ref=main"

  environment = var.environment
  name        = var.project_name
  aws_region  = var.aws_region

  tags = local.common_tags

  # ----------------------------------------------------------
  # NETWORK
  # ----------------------------------------------------------

  vpc_id = module.vpc.vpc_id

  service_subnet_ids = [
    module.vpc.private_subnet_ids["private_subnet_1a"],
    module.vpc.private_subnet_ids["private_subnet_1b"]
  ]

  service_security_group_id = module.vpc.security_group_ids["container-sg"]

  # ----------------------------------------------------------
  # LOAD BALANCER
  # ----------------------------------------------------------

  enable_http_listener  = true
  enable_https_listener = local.alb_https_enabled

  container_port = var.container_port

  target_group_arn = module.alb.target_group_arn

  alb_dns_name = module.alb.alb_dns_name

  # ----------------------------------------------------------
  # CONTAINER
  # ----------------------------------------------------------

  container_image = var.container_image

  container_cpu    = var.container_cpu
  container_memory = var.container_memory

  task_cpu    = var.task_cpu
  task_memory = var.task_memory

  container_environment = var.container_environment

  container_secrets = var.container_secrets

  execution_secret_arns = var.execution_secret_arns

  # ----------------------------------------------------------
  # HEALTH CHECK
  # ----------------------------------------------------------

  enable_container_health_check = true

  # Avoid relying on curl being installed in the image.
  container_health_check_command = [
    "CMD-SHELL",
    "python -c \"import urllib.request; urllib.request.urlopen('http://localhost:${var.container_port}/health')\""
  ]

  container_health_check_interval     = 30
  container_health_check_timeout      = 5
  container_health_check_retries      = 3
  container_health_check_start_period = 60

  # ----------------------------------------------------------
  # FARGATE
  # ----------------------------------------------------------

  cpu_architecture        = "X86_64"
  operating_system_family = "LINUX"

  ephemeral_storage_gib = null

  # ----------------------------------------------------------
  # SERVICE
  # ----------------------------------------------------------

  desired_count = var.desired_count

  platform_version = "LATEST"

  health_check_grace_period_seconds = 60

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  wait_for_steady_state = true

  enable_deployment_circuit_breaker = true
  enable_deployment_rollback        = true

  # ----------------------------------------------------------
  # ECS EXEC
  # ----------------------------------------------------------

  enable_execute_command = false

  # ----------------------------------------------------------
  # LOGGING
  # ----------------------------------------------------------

  log_retention_days = 30

  log_stream_prefix = "ecs"

  enable_container_insights = true

  # ----------------------------------------------------------
  # AUTO SCALING
  # ----------------------------------------------------------

  enable_autoscaling = true

  autoscaling_min_capacity = var.autoscaling_min_capacity
  autoscaling_max_capacity = var.autoscaling_max_capacity

  enable_cpu_autoscaling    = true
  enable_memory_autoscaling = true

  cpu_target_value    = 60
  memory_target_value = 70

  scale_in_cooldown  = 300
  scale_out_cooldown = 60

  task_role_policy_arns = []
}