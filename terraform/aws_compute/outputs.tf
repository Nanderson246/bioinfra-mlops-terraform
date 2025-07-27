## outputs.tf

output "instance_ip" {
  value = aws_instance.mlops_instance.public_ip
}
