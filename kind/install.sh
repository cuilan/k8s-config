#!/bin/bash

kind create cluster --config /home/kind/1c.yaml --name 1c

# 使用 kubectl 查看集群信息
kubectl cluster-info --context kind-1c

# 删除集群
kind delete cluster --name 1c