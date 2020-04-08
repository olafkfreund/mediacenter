#!/bin/bash
export DIR=./descriptors/mylar
helm repo add k8s-usenet https://raw.githubusercontent.com/aldoborrero/k8s-usenet/master/charts/
helm repo update
helm template 0.1 k8s-usenet/mylar > $DIR/00-mylar.yaml