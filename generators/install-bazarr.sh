#!/bin/bash
export DIR=./descriptors/bazarr
helm repo add billimek https://billimek.com/billimek-charts/
helm template bazarr \
    billimek/bazarr > $DIR/00-bazarr.yaml