# ============================================================
# VPC MODULE
# ============================================================

module "vpc" {
  source = "git::https://github.com/AryA281004/neonlens-tf-module.git//vpc?ref=main"

  environment = var.environment
  vpc_name    = var.project_name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  security_all_group = {
    alb-sg = {
      description = "Security group for NeonLens ALB."

      ingress = [
        {
          description = "HTTP"
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        },
        {
          description = "HTTPS"
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]

      egress = [
        {
          description = "All outbound"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }

    container-sg = {
      description = "Security group for NeonLens ECS."

      ingress = [
        {
          description = "Application traffic"
          from_port   = var.container_port
          to_port     = var.container_port
          protocol    = "tcp"
          cidr_blocks = [var.vpc_cidr]
        }
      ]

      egress = [
        {
          description = "All outbound"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  }
}