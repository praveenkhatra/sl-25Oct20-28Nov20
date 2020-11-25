

## Agenda

    Virtualization Overview (Containers vs VM)
    Installation
    Docker Architecture
        - Images
        - Containers
        - Daemon
        - Docker Client
        - Docker Registry (Dockerhub)
    Docker commands
    
    Creating Docker images (Dockerfile)
    Docker Networking
    Docker Volumes
    Docker Compose


## Keywords
    Monolithic vs Microservices Architecture
    Containers
    Hypervisor
        - VMware ESXi
        - MS HyperV 
        - RedHat KVM
        - Oracle VirtualBox
    chroot
    bsd jails
    solaris zones


## Introduction

Docker != Container

**Container Runtime**
    Docker
    rkt
    CoreOS
    runc
    containerd

**Orchestration Platforms**
    - On Premise
        Kubernetes
        Openshift
        Docker Swarm
        Mesosphere
    - Cloud Based (Hosted Kubernetes)
        EKS
        ECS
        AKS
        GKE

Virtual Machines    ---> Hardware level Virtualization
Containers          ---> OS / Kernel Level Virtualization


## Compute Evolution

Physical Machines ---> Virtual Machines ---> Containers ---> Serverless

IT Resources
    - Compute and Memory
    - Networking
    - Storage

## Docker Architecture
    - Docker Host
    - Docker Daemon
    - Images
    - Containers
    - Docker Client
    - Docker Registry (Dockerhub)
        

Templates --> Virtual Machines 
AWS AMIs --> EC2 instances
Docker Images --> Container


VMware Templates
Virtual Box --> Images
OpenStack ---> Images
AWS --> AMIs


## Installation

Linux:
curl -fsSL https://get.docker.com | sh
Mac:
https://docs.docker.com/docker-for-mac/install/
Windows:
https://docs.docker.com/docker-for-windows/install/


## Docker Commands
docker info
docker pull
docker run
        -i - interactive
        -t - tty or terminal
        -d - detached or daemonized mode
exit --> stops the container and exits to docker host
ctrl+P+Q --> exits to docker host without stopping the container










## References:
https://docs.docker.com/engine/images/architecture.svg