#!/bin/bash
set -x

helm template nginx-ingress stable/nginx-ingress --namespace kube-system \
    --set controller.image.repository=quay.io/kubernetes-ingress-controller/nginx-ingress-controller-arm \
    --set controller.image.tag=0.25.1 \
    --set controller.image.runAsUser=33 \
    --set defaultBackend.enabled=false >> nginx.yaml