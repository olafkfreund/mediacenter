#!/bin/bash
export DIR=./descriptors/transmission
helm repo add bananaspliff https://bananaspliff.github.io/geek-charts
helm repo update
helm install transmission bananaspliff/transmission-openvpn \
    --values $DIR/media.transmission-openvpn.values.yaml \
    --namespace media