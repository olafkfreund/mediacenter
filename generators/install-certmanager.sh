#!/bin/bash
set -x

help repo add stable https://kubernetes-charts.storage.googleapis.com && helm repo update
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.14/deploy/manifests/00-crds.yaml
helm repo add jetstack https://charts.jetstack.io && helm repo update
helm template cert-manager jetstack/cert-manager --namespace certmanager >> cert-manager.yaml