resource "aws_vpc_security_group_ingress_rule" "backend_from_alb" {
  security_group_id = module.vpc.security_group_ids["container-sg"]

  referenced_security_group_id = module.vpc.security_group_ids["alb-sg"]

  from_port   = var.container_port
  to_port     = var.container_port
  ip_protocol = "tcp"

  description = "Allow ALB traffic to the backend."
}

resource "aws_vpc_security_group_ingress_rule" "backend_from_prometheus" {
  security_group_id = module.vpc.security_group_ids["container-sg"]

  referenced_security_group_id = module.monitoring.prometheus_security_group_id

  from_port   = var.container_port
  to_port     = var.container_port
  ip_protocol = "tcp"

  description = "Allow Prometheus to scrape the backend."
}