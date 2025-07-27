provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  chart      = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  namespace  = "monitoring"
  create_namespace = true
  version    = "25.6.0" # can be updated

  values = [
    file("${path.module}/values-prometheus.yaml")
  ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  chart      = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  namespace  = "monitoring"
  version    = "7.3.8"

  values = [
    file("${path.module}/values-grafana.yaml")
  ]
}

