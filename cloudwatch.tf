# ============================================================
# CLOUDWATCH METRICS
# ============================================================

module "cloudwatch_metrics" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//cloudwatch_metrics?ref=v1.3.1"

  environment = var.environment
  name        = var.project_name

  enabled = true

  # ==========================================================
  # ALB
  # ==========================================================

  load_balancer_arn_suffix = local.load_balancer_arn_suffix
  target_group_arn_suffix  = local.target_group_arn_suffix

  # ==========================================================
  # ECS
  # ==========================================================

  ecs_cluster_name = module.ecs.cluster_name
  ecs_service_name = module.ecs.service_name

  # ==========================================================
  # ALB ERROR THRESHOLDS
  # ==========================================================

  elb_4xx_threshold    = 5
  elb_5xx_threshold    = 5
  target_4xx_threshold = 5
  target_5xx_threshold = 5

  # ==========================================================
  # ECS RESOURCE THRESHOLDS
  # ==========================================================

  cpu_threshold     = 80
  memory_threshold  = 80
  storage_threshold = 80

  # ==========================================================
  # EVALUATION
  # ==========================================================

  evaluation_periods  = 1
  datapoints_to_alarm = 1

  period = 60

  alarm_actions = []

  treat_missing_data = "notBreaching"

  tags = local.common_tags
}