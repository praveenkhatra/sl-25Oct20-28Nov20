FROM centos:7
RUN yum -y update && yum -y install httpd
EXPOSE 80
COPY run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]


FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install



## Playbook for Ansible Master
- hosts: master
  become: yes
  remote_user: ansible
  vars:
    kubernetes_allow_pods_on_master: true
    kubernetes_role: master

  roles:
    - geerlingguy.docker
    - geerlingguy.kubernetes


## Playbook for Ansible Worker Nodes
- hosts: worker
  become: yes
  remote_user: ansible
  vars:
    kubernetes_role: node
    kubernetes_join_command: "kubeadm join 134.209.27.175:6443 --token v3x9rw.t2ht01yn3kitftoz     --discovery-token-ca-cert-hash sha256:584980b7092d60a5b587f1059e547598c03c781733d1d33863e43123b3300da8"

  roles:
    - geerlingguy.docker
    - geerlingguy.kubernetes
