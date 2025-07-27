# 📦 1. Terraform Configuration (terraform/)

## main.tf
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mlops_instance" {
  ami           = var.ami_id
  instance_type = "t2.medium"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y python3-pip docker.io git
              pip3 install mlflow scikit-learn pandas boto3
              EOF

  tags = {
    Name = "MLOpsBioinfraInstance"
  }
}


