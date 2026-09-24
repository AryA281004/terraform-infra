# ============================================================
# APPLICATION LOAD BALANCER 5XX ALARM
# ============================================================

module "cloudwatch_metrics" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//cloudwatch_metrics?ref=main"

  environment = var.environment
  name        = var.project_name

  enabled = true

  alarm_description = "NeonLens ALB target 5XX errors."

  load_balancer_arn_suffix = local.load_balancer_arn_suffix
  target_group_arn_suffix  = local.target_group_arn_suffix

  comparison_operator = "GreaterThanOrEqualToThreshold"

  evaluation_periods = 1
  datapoints_to_alarm = 1

  period = 60
  statistic = "Sum"

  threshold = 5

  treat_missing_data = "notBreaching"

  alarm_actions = []

  tags = local.common_tags
}