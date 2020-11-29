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







fatal: [167.71.132.83]: FAILED! => {"changed": true, "cmd": "kubeadm join 134.209.27.175:6443 --token lho55q.xza5bzc0t0jbtprv", "delta": "0:00:00.079728", "end": "2020-11-24 19:44:44.726172", "msg": "non-zero return code", "rc": 3, "start": "2020-11-24 19:44:44.646444", "stderr": "discovery.bootstrapToken: Invalid value: \"\": using token-based discovery without caCertHashes can be unsafe. Set unsafeSkipCAVerification as true in your kubeadm config file or pass --discovery-token-unsafe-skip-ca-verification flag to continue\nTo see the stack trace of this error execute with --v=5 or higher", "stderr_lines": ["discovery.bootstrapToken: Invalid value: \"\": using token-based discovery without caCertHashes can be unsafe. Set unsafeSkipCAVerification as true in your kubeadm config file or pass --discovery-token-unsafe-skip-ca-verification flag to continue", "To see the stack trace of this error execute with --v=5 or higher"], "stdout": "", "stdout_lines": []}
fatal: [209.97.181.159]: FAILED! => {"changed": true, "cmd": "kubeadm join 134.209.27.175:6443 --token lho55q.xza5bzc0t0jbtprv", "delta": "0:00:00.090253", "end": "2020-11-24 19:44:43.539357", "msg": "non-zero return code", "rc": 3, "start": "2020-11-24 19:44:43.449104", "stderr": "discovery.bootstrapToken: Invalid value: \"\": using token-based discovery without caCertHashes can be unsafe. Set unsafeSkipCAVerification as true in your kubeadm config file or pass --discovery-token-unsafe-skip-ca-verification flag to continue\nTo see the stack trace of this error execute with --v=5 or higher", "stderr_lines": ["discovery.bootstrapToken: Invalid value: \"\": using token-based discovery without caCertHashes can be unsafe. Set unsafeSkipCAVerification as true in your kubeadm config file or pass --discovery-token-unsafe-skip-ca-verification flag to continue", "To see the stack trace of this error execute with --v=5 or higher"], "stdout": "", "stdout_lines": []}