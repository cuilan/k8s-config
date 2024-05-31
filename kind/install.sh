#!/bin/bash

kind create cluster --config ./1c.yaml --name 1c

# 使用 kubectl 查看集群信息
kubectl cluster-info --context kind-1c

# 删除集群
kind delete cluster --name 1c

# 导出配置文件
kubectl config view --minify --flatten > kubeconfig.yaml