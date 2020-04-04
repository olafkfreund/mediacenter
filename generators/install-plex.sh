#!/bin/bash
cd /home/vscode
export DIR=/workspaces/flux-node/descriptors/plex
helm template plex kube-plex/charts/kube-plex/ \
  --values $DIR/media.plex.values.yml \
  --namespace media >> $DIR/00-plex.yaml