output "mlflow_server_ip" {
  value = aws_instance.mlflow.public_ip
}

output "mlflow_tracking_uri" {
  value = "http://${aws_instance.mlflow.public_ip}:5000"
}

