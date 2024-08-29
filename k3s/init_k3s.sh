#!/bin/bash

# 安装docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker --now
systemctl start docker --now
docker info

# 环境准备

# 关闭防火墙
systemctl disable firewalld --now
systemctl stop firewalld --now

# 关闭selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

# 关闭swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

# 关闭NetworkManager
systemctl disable NetworkManager --now
systemctl stop NetworkManager --now
# reboot

#
yum-config-manager --disable rancher-k3s-common-stable

# 安装k3s
# curl -sfL https://get.k3s.io | sh -

# 中国加速安装
curl -sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -

curl –sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | \
     INSTALL_K3S_MIRROR=cn sh -s - \
     --system-default-registry "registry.cn-hangzhou.aliyuncs.com"

curl –sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | \
     INSTALL_K3S_MIRROR=cn INSTALL_K3S_CHANNEL=v1.29 sh -s - \
     --system-default-registry "registry.cn-hangzhou.aliyuncs.com" \
     --docker \
	--data-dir=/data/k3s-data \
     --write-kubeconfig ~/.kube/config \
     --write-kubeconfig-mode 666 \
     --log /data/logs/k3s/k3s.log \
     --disable traefik

# 配置 containerd 的 mirror
cat > /etc/rancher/k3s/registries.yaml <<EOF
mirrors:
  docker.io:
    endpoint:
      - "http://hub-mirror.c.163.com"
      - "https://docker.mirrors.ustc.edu.cn"
      - "https://registry.docker-cn.com"
EOF

systemctl restart k3s

/usr/local/bin/k3s server --docker --data-dir=/data/k3s-data --log /data/logs/k3s/k3s.log --disable traefik


cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable kubelet && systemctl start kubelet

## 另外，你也可以指定版本安装
## yum install -y kubelet-1.25.6 kubectl-kubelet-1.25.6 kubeadm-kubelet-1.25.6
