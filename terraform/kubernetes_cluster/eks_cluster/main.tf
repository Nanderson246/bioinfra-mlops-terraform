provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = var.cluster_name
  cluster_version = var.k8s_version
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      max_size       = 3
      min_size       = 1
    }
  }

  tags = {
    Environment = "dev"
    Project     = "bioinfra-mlops"
  }
}

