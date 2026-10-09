# ============================================================
# GENERAL
# ============================================================




variable "project_name" {
  description = "Project/application name."
  type        = string

  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name must not be empty."
  }
}


# ============================================================
# VPC
# ============================================================

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



# ============================================================
# ECS
# ============================================================

variable "container_image" {
  description = "Full ECS container image URI."
  type        = string
}


variable "container_port" {
  description = "Application container port."
  type        = number
  default     = 3000
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


# ============================================================
# ROUTE 53
# ============================================================

variable "domain_name" {
  description = "Existing public Route 53 hosted zone."
  type        = string

  validation {
    condition     = length(trimspace(var.domain_name)) > 0
    error_message = "domain_name must not be empty."
  }
}


variable "frontend_domain" {
  description = "Frontend custom domain pointing to CloudFront."
  type        = string

  validation {
    condition     = length(trimspace(var.frontend_domain)) > 0
    error_message = "frontend_domain must not be empty."
  }
}


variable "backend_domain" {
  description = "Backend custom domain pointing to the Application Load Balancer."
  type        = string

  validation {
    condition     = length(trimspace(var.backend_domain)) > 0
    error_message = "backend_domain must not be empty."
  }
}


# ============================================================
# ALB HTTPS
# ============================================================

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for ALB HTTPS. Must be in the same AWS region as the ALB."
  type        = string
  default     = null
}


# ============================================================
# FRONTEND S3
# ============================================================

variable "frontend_bucket_name" {
  description = "Optional frontend S3 bucket name."
  type        = string
  default     = null
}


# ============================================================
# FRONTEND CLOUDFRONT
# ============================================================

variable "frontend_acm_certificate_arn" {
  description = "CloudFront ACM certificate ARN. Must be in us-east-1."
  type        = string
  default     = null
}


# ============================================================
# SNS
# ============================================================

variable "notification_email" {
  description = "Optional email for S3 SNS notifications."
  type        = string
  default     = null
}


# ============================================================
# BACKEND ENVIRONMENT
# ============================================================

variable "container_environment" {
  description = "Non-sensitive ECS environment variables."
  type        = map(string)
  default     = {}
}


# ============================================================
# BACKEND SECRETS
# ============================================================

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

variable "host_header_values" {
  description = "List of host header values to match."
  type        = list(string)
  default     = []
}

variable "project_id" {
  description = "MongoDB Atlas project ID."
  type        = string
  default     = null
}

variable "mongodb_atlas_public_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_private_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_project_id" {
  description = "MongoDB Atlas project ID"
  type        = string
  sensitive   = true
}

variable "mongodb_atlas_region" {
  description = "MongoDB Atlas region"
  type        = string
}

variable "mongodb_atlas_vpc_cidr" {
  description = "MongoDB Atlas VPC CIDR"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.environment))
    error_message = "environment must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "private_route_table_ids" {
  description = "Route table IDs associated with the private subnets."
  type        = list(string)
}