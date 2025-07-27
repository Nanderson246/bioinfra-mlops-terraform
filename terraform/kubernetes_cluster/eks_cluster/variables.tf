variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_name" {
  default = "bioinfra-eks-cluster"
}

variable "k8s_version" {
  default = "1.29"
}

variable "vpc_id" {
  description = "The VPC ID where EKS will be deployed"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs in the VPC"
  type        = list(string)
}

