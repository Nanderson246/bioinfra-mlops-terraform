output "grafana_admin_password" {
  value     = helm_release.grafana.metadata[0].name
  sensitive = true
}

output "grafana_url" {
  value = "http://localhost:3000"
  description = "Run kubectl port-forward service/grafana 3000:80 -n monitoring"
}

output "prometheus_url" {
  value = "http://localhost:9090"
  description = "Run kubectl port-forward service/prometheus-server 9090 -n monitoring"
}

