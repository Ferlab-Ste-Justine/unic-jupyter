#!/usr/bin/env bash

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update

# Helm release name
RELEASE=jhub
# k8s namespace
NAMESPACE=jupyterhub
# Helm chart version
CHARTVERSION=1.0.0

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=$CHARTVERSION \
  --values jhub-config.yaml