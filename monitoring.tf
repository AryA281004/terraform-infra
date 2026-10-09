# ============================================================
# PROMETHEUS / GRAFANA MONITORING
# ============================================================

module "monitoring" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//monitoring?ref=v1.4.3"

  # ==========================================================
  # GENERAL
  # ==========================================================

  environment = var.environment
  name        = var.project_name
  aws_region  = var.aws_region

  tags = local.common_tags

  # ==========================================================
  # NETWORK
  # ==========================================================

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnet_ids

  # ==========================================================
  # EXISTING ECS CLUSTER
  # ==========================================================

  ecs_cluster_arn = module.ecs.cluster_arn

  # ==========================================================
  # BACKEND
  # ==========================================================

  backend_service_name = module.ecs.service_name

  container_port = var.container_port

  backend_security_group_id = local.container_security_group_id

  # ==========================================================
  # SERVICE DISCOVERY
  # ==========================================================

  service_discovery_namespace_id = module.ecs.service_discovery_namespace_id

  prometheus_service_discovery_name = "prometheus"

  # ==========================================================
  # PROMETHEUS
  # ==========================================================

  prometheus_image = "prom/prometheus:v3.8.1"

  prometheus_port = 9090

  prometheus_cpu    = 1024
  prometheus_memory = 2048

  prometheus_desired_count = 1

  prometheus_retention = "15d"

  # ==========================================================
  # GRAFANA
  # ==========================================================

  grafana_image = "grafana/grafana:12.2.0"

  grafana_port = 3030

  grafana_cpu    = 512
  grafana_memory = 1024

  grafana_desired_count = 1

  # ==========================================================
  # EFS
  # ==========================================================

  prometheus_efs_size_gib = 20
  grafana_efs_size_gib    = 5

  # ==========================================================
  # LOGGING
  # ==========================================================

  log_retention_days = 30
}