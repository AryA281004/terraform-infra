# ============================================================
# VPC
# ============================================================

output "vpc_id" {
  description = "NeonLens VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "security_group_ids" {
  description = "NeonLens security groups."
  value       = module.vpc.security_group_ids
}


# ============================================================
# ALB
# ============================================================

output "alb_id" {
  description = "Application Load Balancer ID."
  value       = module.alb.alb_id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name."
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "Application Load Balancer ARN."
  value       = module.alb.alb_arn
}

output "target_group_arn" {
  description = "ALB target group ARN."
  value       = module.alb.target_group_arn
}


# ============================================================
# ECS
# ============================================================

output "ecs_cluster_name" {
  description = "ECS cluster name."
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "ECS service name."
  value       = module.ecs.service_name
}

output "ecs_task_definition_arn" {
  description = "Current ECS task definition ARN."
  value       = module.ecs.task_definition_arn
}

output "ecs_execution_role_arn" {
  description = "ECS execution role ARN."
  value       = module.ecs.execution_role_arn
}

output "ecs_task_role_arn" {
  description = "ECS task role ARN."
  value       = module.ecs.task_role_arn
}

output "ecs_log_group_name" {
  description = "ECS CloudWatch log group."
  value       = module.ecs.log_group_name
}


# ============================================================
# ROUTE 53
# ============================================================

output "backend_dns_name" {
  description = "Backend Route53 record."
  value       = module.route53.record_fqdns["backend"]
}


# ============================================================
# S3
# ============================================================

output "frontend_bucket_name" {
  description = "Frontend S3 bucket."
  value       = module.s3.bucket_name
}

output "frontend_bucket_arn" {
  description = "Frontend S3 bucket ARN."
  value       = module.s3.bucket_arn
}


# ============================================================
# CLOUDFRONT
# ============================================================

output "cloudfront_distribution_id" {
  description = "Frontend CloudFront distribution ID."
  value       = module.s3.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  description = "Frontend CloudFront domain."
  value       = module.s3.cloudfront_domain_name
}

output "cloudfront_url" {
  description = "Frontend CloudFront URL."
  value       = module.s3.cloudfront_url
}


# ============================================================
# CLOUDWATCH
# ============================================================

output "alb_5xx_alarm_name" {
  description = "ALB 5XX CloudWatch alarm."
  value       = module.cloudwatch_metrics.alarm_name
}