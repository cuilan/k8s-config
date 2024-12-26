#!/bin/bash

helm repo add portainer https://portainer.github.io/k8s/

helm repo update

helm install --create-namespace -n portainer portainer portainer/portainer

helm uninstall portainer -n portainer

Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace portainer -o jsonpath="{.spec.ports[1].nodePort}" services portainer)
  export NODE_IP=$(kubectl get nodes --namespace portainer -o jsonpath="{.items[0].status.addresses[0].address}")
  echo https://$NODE_IP:$NODE_PORT
