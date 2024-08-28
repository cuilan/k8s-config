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
---
## 安装k3s

```bash
curl -sfL https://get.k3s.io | sh -
```

中国用户，可以使用以下方法加速安装：
```bash
curl -sfL https://rancher-mirror.rancher.cn/k3s/k3s-install.sh | INSTALL_K3S_MIRROR=cn sh -
```

/usr/local/bin/k3s server --docker --data-dir=/data/k3s-data --log /data/logs/k3s/k3s.log --disable traefik
