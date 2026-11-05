terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "my-remote-infra-bucket-aryan"
    key    = "neonlens/terraform.tfstate"
    region = "us-east-1"
  }
}