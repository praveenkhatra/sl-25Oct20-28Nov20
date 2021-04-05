

borg (google) ---> kubernetes (Open Sourced in 2014)
Cloud Native Computing Foundation (Parent --> Linux Foundation)
k8s --> Kubernetes
k8s Master / Manager / Server
k8s Worker / nodes / slave / minions




## Kubernetes Infrastructure Terminology


Node
Cluster

Master (Manager) --> Control Plane
    - Kube-apiserver --> API server for management and orchestration
    - etcd ---> key-value store for all infra configuration settings
    - kube-scheduler --> Schedules pods on different worker nodes
    - kube-controller --> Controls all k8s services
    - Container runtime

Worker Node --> Data Plane
    - kubelet - k8s agent running on all worker nodes
    - kube-proxy - responsible for all communication to and from the pods
    - Container runtime - docker/rkt/coreos


## Installation

Refer the document and check the Ansible way.

## k8s primitives / Objects

    - Pod
    - ReplicaSets (Older version --> ReplicationController)
    - Services
    - Load Balancers
    - Deployments
    - Ingress


## Kubernetes YAML files

# Structure

A - API Version
K - Kind (pod/service/deployemnt)
M - Metadata
S - Specs





References:

https://kubernetes.io/docs/tutorials/kubernetes-basics/explore/explore-intro/





