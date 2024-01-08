#!/bin/bash

helm repo add traefik https://traefik.github.io/charts

helm repo update

helm install traefik traefik/traefik -n kube-addons --create-namespace -f traefik.values.yaml

helm uninstall traefik -n kube-addons
