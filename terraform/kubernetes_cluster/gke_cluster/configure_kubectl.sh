#!/bin/bash
# configure_kubectl.sh — for GKE

PROJECT_ID="your-project-id"
REGION="us-central1"
CLUSTER_NAME="bioinfra-gke-cluster"

echo "📡 Updating kubeconfig for GKE cluster: $CLUSTER_NAME"
gcloud container clusters get-credentials "$CLUSTER_NAME" \
  --region "$REGION" \
  --project "$PROJECT_ID"

