# k3s 安装

## 环境准备

```bash
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
reboot
```

## 安装

```bash
# 安装k3s
curl -sfL https://get.k3s.io | sh -

# 查看k3s状态
systemctl status k3s

# 查看k3s版本
k3s version

# 查看k3s集群信息
k3s kubectl cluster-info

# 查看k3s集群节点信息
k3s kubectl get nodes

# 查看k3s集群pod信息
k3s kubectl get pods -A

/usr/local/bin/k3s server --docker --data-dir=/data/k3s-data --log /data/logs/k3s/k3s.log --disable traefik
```