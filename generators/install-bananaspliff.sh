#!/bin/bash
export DIR=./descriptors/transmission
helm repo add bananaspliff https://bananaspliff.github.io/geek-charts
helm repo update
helm template transmission bananaspliff/transmission-openvpn \
    --values $DIR/media.transmission-openvpn.values.yaml \
    --namespace media >> $DIR/00-transmission.yaml