#!/bin/bash
export DIR=./descriptors/sonarr
helm template  sonarr bananaspliff/sonarr \
    --values $DIR/media.sonarr.values.yaml \
    --namespace media >> $DIR/00-sonarr.yaml