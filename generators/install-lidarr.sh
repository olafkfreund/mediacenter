#!/bin/bash
export DIR=./descriptors/lidarr
helm repo add billimek https://billimek.com/billimek-charts/
helm template billimek/lidarr > $DIR/00-lidarr.yaml