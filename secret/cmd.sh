#!/bin/bash

kubectl create secret generic reg.weattech.com \
    --from-file=.dockerconfigjson=/root/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson \
    -n test


kubectl get secret reg.weattech.com --output=yaml -n test