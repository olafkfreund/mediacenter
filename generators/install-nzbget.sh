#!/bin/bash
export DIR=/workspaces/flux-node/descriptors/nzbget
helm repo add billimek https://billimek.com/billimek-charts/
helm template nzbget billimek/nzbget \
    --set timezone="Europe/London" > $DIR/00-nzbget.yaml