provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "example"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = "vpc-0aa3b5020d63663a0"
  subnet_ids = ["subnet-0d3d8392a0ffd9fa7", "subnet-0474e8d2c87f43a8d"]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
