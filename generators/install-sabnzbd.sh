#!/bin/bash
set -x

helm repo add helm-repo-arm https://whizzosoftware.github.io/helm-repo-arm/
helm install sabnzbd helm-repo-arm/sabnzbd