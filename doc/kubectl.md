# kubectl一些常用命令

## 一、基本操作

```
kubectl version  显示kubectl的版本信息
kubectl cluster-info  显示集群的基本信息
kubectl get nodes  显示所有节点信息
kubectl get pods -n {}  显示namespace下所有pod信息
kubectl create deployment {name} --image={image}  创建pod
kubectl scale deployment {name} --replicas={num}  修改pod数量
kubectl describe pod {name} -n {}  显示指定pod的详细信息
kubectl logs {name} -n {}  显示指定pod的日志
kubectl exec -it {name} -- /bin/bash
kubectl delete deployment {name}  删除pod
kubectl edit svc {name} -n {}  编辑svc
```

## 二、调试和故障排查

```
kubectl describe node {name}  显示指定节点的详细信息
kubectl describe deployment {name} -n {}  显示指定deployment的详细信息
kubectl describe service {name} -n {}  显示指定service的详细信息
kubectl get event  显示所有事件信息
kubectl
kubectl
kubectl
kubectl
kubectl
```