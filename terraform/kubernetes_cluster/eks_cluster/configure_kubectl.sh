#!/bin/bash
# configure_kubectl.sh

REGION="us-west-2"
CLUSTER_NAME="bioinfra-eks-cluster"

echo "📡 Updating kubeconfig for EKS cluster: $CLUSTER_NAME"
aws eks --region "$REGION" update-kubeconfig --name "$CLUSTER_NAME"

