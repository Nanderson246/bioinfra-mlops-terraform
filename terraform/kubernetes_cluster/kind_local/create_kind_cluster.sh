#!/bin/bash
# Create KinD Cluster locally

CLUSTER_NAME="bioinfra-kind"
K8S_IMAGE="kindest/node:v1.29.2"

echo "🚀 Creating local KinD cluster: $CLUSTER_NAME"
kind create cluster --name "$CLUSTER_NAME" --image "$K8S_IMAGE" --config kind_cluster.yaml

echo "✅ KinD cluster created. Check with: kubectl get nodes"

