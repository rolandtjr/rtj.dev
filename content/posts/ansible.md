---
author: "Roland Thomas Jr"
title: "Ansible Rocks!"
date: "2023-06-08"
description: ""
tags: ["ansible"]
ShowToc: false
ShowBreadCrumbs: true
---
What is Ansible?

Ansible is an open-source configuration management tool that uses a declarative language to automate infrastructure configuration. It can be used for tasks like installing software, configuring services, and managing users and permissions. Ansible is known for its ease of use and has a large community of users who contribute to its development.

```yml
---
- name: Update web servers
  hosts: webservers
  remote_user: root

  tasks:
  - name: Ensure apache is at the latest version
    ansible.builtin.yum:
      name: httpd
      state: latest
  - name: Write the apache config file
    ansible.builtin.template:
      src: /srv/httpd.j2
      dest: /etc/httpd.conf

- name: Update db servers
  hosts: databases
  remote_user: root

  tasks:
  - name: Ensure postgresql is at the latest version
    ansible.builtin.yum:
      name: postgresql
      state: latest
  - name: Ensure that postgresql is started
    ansible.builtin.service:
      name: postgresql
      state: started
```

---