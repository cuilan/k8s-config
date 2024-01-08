#!/bin/bash

set -e

kubectl apply -f ns-dev.json
kubectl apply -f ns-test.json
kubectl apply -f ns-kube-addons.json
