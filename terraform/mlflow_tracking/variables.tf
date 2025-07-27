variable "aws_region" {
  default = "us-west-2"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  description = "SSH key name for EC2 login"
  type        = string
}

variable "s3_bucket" {
  description = "S3 bucket name for MLflow artifacts"
  type        = string
}

