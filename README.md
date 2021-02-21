# microfunctions-helm

[MicroFunctions](https://microFunctions.io/)  is open-source serverless platform bthat lets you deploy small bits of code without having to worry about the underlying infrastructure plumbing. It leverages Kubernetes  resources to provide auto-scaling, API routing, monitoring, troubleshooting and supports every programming language. (Nodejs,Go,python,..).

## TL;DR

```console
$ helm repo add  microfunctions https://microfunctionsio.github.io/microfunctions-helm
$ helm install my-release microfunctions
```

## Introduction

This chart bootstraps a [MicroFunctions](https://microFunctions.io/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [Bitnami MongoDB chart](https://github.com/bitnami/charts/tree/master/bitnami/mongodb)  chart which is required for bootstrapping a Mongodb deployment for the database requirements of the MicroFunctions platform,
and the [Bitnami Rabbitmq chart](https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq) chart which is required  for messaging protocols.
and :
- [nginx-ingress-controller](https://kubernetes.github.io/ingress-nginx)  
- [kong](https://konghq.com/solutions/kubernetes-ingress/)
- [cert-manager](https://cert-manager.io/docs/)
- [metrics-server](https://github.com/kubernetes-sigs/metrics-server)

## Prerequisites

- Kubernetes v1.17+
- Helm 3.1.0
- PV provisioner support in the underlying infrastructure
- ReadWriteMany volumes for deployment scaling
