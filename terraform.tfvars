# ============================================================
# GENERAL
# ============================================================


project_name = "neonlens"


# ============================================================
# GRAFANA & PROMETHEUS
# ============================================================



grafana_port = 3030


grafana_health_check_path = "/"


prometheus_port              = 9090
prometheus_health_check_path = "/-/healthy"


# ============================================================
# ECS
# ============================================================




container_port = 3000

task_cpu    = 2048
task_memory = 4096

container_cpu    = 1920
container_memory = 3840

blackbox_exporter_cpu = 128
blackbox_exporter_memory = 256

desired_count = 2

autoscaling_min_capacity = 2
autoscaling_max_capacity = 6

enable_blackbox_exporter = true

blackbox_exporter_image = "prom/blackbox-exporter:v0.27.0"


domain_name = "aryandudhat.qd.je"


mongodb_atlas_project_id = "69cce2923d0b40967fb4be95"
mongodb_atlas_region     = "us-east-1"
mongodb_atlas_vpc_cidr   = "192.168.248.0/21"



# ============================================================
# FRONTEND S3
# ============================================================

frontend_bucket_name = null




# ============================================================
# SNS
# ============================================================

notification_email = null

# ============================================================
# HOST HEADER VALUES
# ============================================================

