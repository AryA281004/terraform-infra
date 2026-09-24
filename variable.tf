# ============================================================
# VARIABLES
# ============================================================

variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "project_name" {
  description = "Project/application name."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR."
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet configuration."
  type = map(object({
    cidr_block = string
    az         = string
  }))
}

variable "private_subnet_cidr" {
  description = "Private subnet configuration."
  type = map(object({
    cidr_block      = string
    az              = string
    nat_gateway_key = string
  }))
}

variable "container_image" {
  description = "Full ECS container image URI."
  type        = string
}

variable "container_port" {
  description = "Application container port."
  type        = number
  default     = 8000
}

variable "container_cpu" {
  description = "Container CPU."
  type        = number
  default     = 512
}

variable "container_memory" {
  description = "Container memory."
  type        = number
  default     = 1024
}

variable "task_cpu" {
  description = "ECS task CPU."
  type        = number
  default     = 512
}

variable "task_memory" {
  description = "ECS task memory."
  type        = number
  default     = 1024
}

variable "desired_count" {
  description = "Initial ECS desired count."
  type        = number
  default     = 2
}

variable "autoscaling_min_capacity" {
  description = "Minimum ECS tasks."
  type        = number
  default     = 2
}

variable "autoscaling_max_capacity" {
  description = "Maximum ECS tasks."
  type        = number
  default     = 6
}

variable "domain_name" {
  description = "Existing public Route53 hosted zone."
  type        = string
}

variable "record_name" {
  description = "Backend DNS record."
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for ALB HTTPS. Must be in the same AWS region as the ALB."
  type        = string
  default     = null
}

variable "frontend_bucket_name" {
  description = "Optional frontend S3 bucket name."
  type        = string
  default     = null
}

variable "frontend_domain" {
  description = "Optional CloudFront custom domain."
  type        = string
  default     = null
}

variable "frontend_acm_certificate_arn" {
  description = "Optional CloudFront ACM certificate ARN. Must be in us-east-1."
  type        = string
  default     = null
}

variable "notification_email" {
  description = "Optional email for S3 SNS notifications."
  type        = string
  default     = null
}

variable "container_environment" {
  description = "Non-sensitive ECS environment variables."
  type        = map(string)
  default     = {}
}

variable "container_secrets" {
  description = "ECS environment variable -> Secrets Manager ARN."
  type        = map(string)
  default     = {}
}

variable "execution_secret_arns" {
  description = "Secrets Manager ARNs accessible by ECS execution role."
  type        = list(string)
  default     = []
}