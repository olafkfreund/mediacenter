#!/bin/bash
export DIR=./descriptors/Ubooquity
helm repo add halkeye https://halkeye.github.io/helm-charts/
helm repo update
helm template  halkeye/ubooquity --version 0.1.0 > $DIR/00ubooquity.yaml