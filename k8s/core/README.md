

## 创建 kubeadm config 副本
sudo kubeadm config print init-defaults > kubeadm-config.yaml

## 创建 k8s 节点
sudo kubeadm init --config=kubeadm-config.yaml | tee kubeadm-init.log


