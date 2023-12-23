#!/bin/bash

set -e

kubectl apply -f namespace-dev.json
kubectl apply -f namespace-test.json
