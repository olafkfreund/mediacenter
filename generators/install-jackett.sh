#!/bin/bash
export DIR=./descriptors/jackett
helm template jackett bananaspliff/jackett \
    --values  $DIR/media.jackett.values.yaml \
    --namespace media >> $DIR/00-jackett.yaml