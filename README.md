# microfunctions-helm

[MicroFunctions](https://microFunctions.io/)  is open-source serverless platform bthat lets you deploy small bits of code without having to worry about the underlying infrastructure plumbing. It leverages Kubernetes  resources to provide auto-scaling, API routing, monitoring, troubleshooting and supports every programming language. (Nodejs,Go,python,..).

## TL;DR

```console
$ helm repo add  microfunctions https://microfunctionsio.github.io/microfunctions-helm
$ helm install my-release microfunctions/microfunctions -n microfunctions --create-namespace 
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
## Source Code

* <https://github.com/microfunctionsio/microfunctions-helm>

## Requirements

Kubernetes: `>=1.17.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | kong | 3.4.5 |
| https://charts.bitnami.com/bitnami | metrics-server | 5.3.1 |
| https://charts.bitnami.com/bitnami | mongodb | 7.8.10 |
| https://charts.bitnami.com/bitnami | nginx-ingress-controller | 7.5.0 |
| https://charts.bitnami.com/bitnami | rabbitmq | 7.6.9 |
| https://charts.jetstack.io | cert-manager | 1.2.0 |

## Parameters

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ownerEmail | string | `"owner@microfunctions.local"` |  |
| ownerPassword | string |  | random 10 character long alphanumeric string     |
| mongodb.mongodbDatabase | string | `"microfunctions"` |  |
| mongodb.mongodbUsername | string | `"microfunctions"` |  |
| cert-manager.enabled | bool | `false` |  |
| kong.enabled | bool | `false` |  |
| nginx-ingress-controller.enabled | bool | `false` |  |
| metrics-server.enabled | bool | `false` |  |
| microfunctionsapis.autoscaling.enabled | bool | `false` |  |
| microfunctionsapis.autoscaling.maxReplicas | int | `100` |  |
| microfunctionsapis.autoscaling.minReplicas | int | `1` |  |
| microfunctionsapis.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionsapis.replicaCount | int | `1` |  |
| microfunctionsapis.securityContext | object | `{}` |  |
| microfunctionsapis.tolerations | list | `[]` |  |
| microfunctionsauth.JwtSecretExpiresIn | string | `"43200s"` |  |
| microfunctionsauth.autoscaling.enabled | bool | `false` |  |
| microfunctionsauth.autoscaling.maxReplicas | int | `100` |  |
| microfunctionsauth.autoscaling.minReplicas | int | `1` |  |
| microfunctionsauth.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionsauth.replicaCount | int | `1` |  |
| microfunctionsauth.securityContext | object | `{}` |  |
| microfunctionsauth.tolerations | list | `[]` |  |
| microfunctionscluster.autoscaling.enabled | bool | `false` |  |
| microfunctionscluster.autoscaling.maxReplicas | int | `100` |  |
| microfunctionscluster.autoscaling.minReplicas | int | `1` |  |
| microfunctionscluster.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionscluster.replicaCount | int | `1` |  |
| microfunctionsconsole.autoscaling.enabled | bool | `false` |  |
| microfunctionsconsole.autoscaling.maxReplicas | int | `100` |  |
| microfunctionsconsole.autoscaling.minReplicas | int | `1` |  |
| microfunctionsconsole.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionsconsole.controllerHost | string | `"microfunctions.local"` |  |
| microfunctionsconsole.controllerPath | string | `"/microfunctions/apis"` |  |
| microfunctionsconsole.ingress.enabled | bool | `false` |  |
| microfunctionsconsole.ingress.resources | object | `{}` |  |
| microfunctionsconsole.replicaCount | int | `1` |  |
| microfunctionscontroller.autoscaling.enabled | bool | `false` |  |
| microfunctionscontroller.autoscaling.maxReplicas | int | `100` |  |
| microfunctionscontroller.autoscaling.minReplicas | int | `1` |  |
| microfunctionscontroller.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionscontroller.ingress.enabled | bool | `false` |  |
| microfunctionscontroller.replicaCount | int | `1` |  |
| microfunctionscontroller.resources | object | `{}` |  |
| microfunctionscontroller.securityContext | object | `{}` |  |
| microfunctionsinitjob.autoscaling.enabled | bool | `false` |  |
| microfunctionsinitjob.autoscaling.maxReplicas | int | `100` |  |
| microfunctionsinitjob.autoscaling.minReplicas | int | `1` |  |
| microfunctionsinitjob.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionsinitjob.restartPolicy | string | `"OnFailure"` |  |
| microfunctionsserverless.autoscaling.enabled | bool | `false` |  |
| microfunctionsserverless.autoscaling.maxReplicas | int | `100` |  |
| microfunctionsserverless.autoscaling.minReplicas | int | `1` |  |
| microfunctionsserverless.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| microfunctionsserverless.replicaCount | int | `1` |  |
| microfunctionsserverless.tolerations | list | `[]` |  |



