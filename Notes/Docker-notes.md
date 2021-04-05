

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
    Docker Swarm
    Kubernetes Intro
    Monitoring
        - Nagios
        - ELK Stack

    DevOps on AWS


## Keywords
    Monolithic vs Microservices Architecture
    Containers
    Hypervisor
        - VMware ESXi
        - MS HyperV 
        - RedHat KVM
        - Oracle VirtualBox
    Older Container (like) Technology
        - chroot
        - bsd jails
        - solaris zones

docker-ce   ---> Community Edition
docker-ee   ---> Enterprise Edition

Mirantis acquired docker EE

Openstack


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

docker rm  --> remove container ---> docker container rm
docker rmi --> remove image ---> docker image rm
docker tag


Dockerfile --> Docker image (docker build) ---> Docker container (docker run)

## Dockerfile

INSTRUCTIONS arguments

FROM ubuntu:latest

LABEL maintainer="sk12k@sl.com"

RUN apt-get update
RUN apt-get install -y python3

COPY myapp.py /tmp/myapp.py

COPY <source> <destination>

ADD <source> <destination> 

EXPOSE 80
EXPOSE 443
EXPOSE 8080

ENV

CMD ./myapp.py

ENTRYPOINT

## Sample Dockerfile

FROM ubuntu:latest

LABEL maintainer="sk12k@sl.com"

RUN apt-get update
RUN apt-get install -y python3

**Run the following command to create an image from dockerfile**

docker build -t myimage:tag .


## Class Exercise

## Exercise 1:

1. Create DockerHub account, if you don't have already. (hub.docker.com)

2. Pull any image (ubuntu / nginx / alpine / busybox)

3. Create a container (docker run)

4. make some changes inside your container
Hint: Create a file/user etc.

5. Save that container as a new image on your Docker host
docker container commit <container-id> <image-name:tag>

6. Push the image to your docker hub account
Hint: docker image push


## Exercise 2

**Docker**
https://docs.docker.com/get-started/
https://docs.docker.com/get-started/nodejs/build-images/


docker run --publish 8000:8080 --detach --name sk-bb bulletinboard:1.0


docker tag bulletinboard:1.0 sk12k/bulletinboard:1.0

## Docker Compose

**Installation**

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

Reference: https://docs.docker.com/compose/install/

**Docker Compose**
https://docs.docker.com/compose/gettingstarted/
https://docs.docker.com/compose/django/

## Docker Networks

root@docker:~# docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
d7b5fd42c14e        bridge              bridge              local
ef5b3c84055a        host                host                local
6fa07a0914f1        mynetwork           bridge              local
20dad66b7f5f        none                null                local



**Port forwarding**

-P 
docker run -itd -P nginx --> forward 32768 (host) to 80 (Guest)

Range: 32768 - 65000


-p 8000:8080

-p <portonhost>:<portoncontainer>

docker run --publish 8000:8080 --detach --name sk-bb bulletinboard:1.0

## Docker Volumes

docker run -itd -v <pathonhost>/<pathonguest> <image-name>


## Class Exercise 3
7.12 - dockerregistrywithcentos.docx

## Class Exercise 4
7.15 - Docker Networking with 2 SSHs.docx


## Docker Swarm

## Initialize Docker Swarm

docker swarm init --advertise-addr 165.232.107.200

Swarm initialized: current node (k9wy77r7w0w5ihij20osp15iq) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-2tfvw3n9uxadwbbr34ue1fde95as2tlxazkfuvfwftfom6grxw-axjn250z0843a599sx9x6fkkp 165.232.107.200:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.











## Practice:
    - Generic Commands (legacy)
    - container management commands
    - image management commands
    - network management commands




## References:
https://docs.docker.com/engine/images/architecture.svg
https://docs.docker.com/engine/reference/builder/
https://frightanic.com/computers/docker-default-container-names/
https://docs.docker.com/get-started/
https://docs.docker.com/get-started/resources/
https://docs.docker.com/network/
https://github.com/kelseyhightower/kubernetes-the-hard-way


