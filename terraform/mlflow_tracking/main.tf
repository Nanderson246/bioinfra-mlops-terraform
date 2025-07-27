provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mlflow" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y python3-pip
              pip3 install mlflow gunicorn
              nohup mlflow server \
                --backend-store-uri sqlite:///mlflow.db \
                --default-artifact-root s3://${var.s3_bucket}/mlflow/ \
                --host 0.0.0.0 \
                --port 5000 > mlflow.log 2>&1 &
              EOF

  tags = {
    Name = "MLflowTrackingServer"
  }
}

