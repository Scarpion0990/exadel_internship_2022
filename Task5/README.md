My Exadel Task 5 project (Ansible for beginners)
======================================================

Important points:
------------------
1. Read documentation about System configuration management. *Answer: I have read this [documentation](https://www.atlassian.com/continuous-delivery/principles/configuration-management).*
2. Learn about the advantages and disadvantages of Ansible over other tools. *Answer: I have learned he advantages and disadvantages of Ansible over other tools. [Reference](https://www.whizlabs.com/blog/ansible-advantages-and-disadvantages/)*
3. Become familiar with ansible basics and YAML syntax. *Answer: I have became familiar with ansible and YAML sytax*
4. Basics of working with Ansible from the official documentation. *Answer: Done*  
**EXTRA** Read the Jinja2 templating documentation. *Answer: I have read [this article](https://ttl255.com/jinja2-tutorial-part-1-introduction-and-variable-substitution/)*

Tasks
---------------

1. Deploy three virtual machines in the Cloud. Install Ansible on one of them (control_plane). *Answer: I deployed three virtual machines in the AWS and installed ansible on control_plane<br> ![ansible](./images/1.png)* <br>
*Commands to install ansible*
```
   sudo apt update
   sudo apt install software-properties-common
   sudo apt-add-repository ppa:ansible/ansible
   sudo apt update
   sudo apt install ansible
```

2. Ping pong - execute the built-in ansible ping command. Ping the other two machines.
*Answer: To connect firstly, I created new SSH key pair*

```
   ssh-keygen
   cat .ssh/id_rsa.pub
```
*In the Slave VMs copied the public key and installed Python*

    nano .ssh/authorized_keys
    sudo apt update
    sudo apt install python3

*Ansible hosts file configured*

    [exadel]
    slave_1 ansible_ssh_host=172.31.24.8
    slave_2 ansible_ssh_host=172.31.31.107

![ansible](./images/2.png)

3. My First Playbook: write a playbook for installing Docker on two machines and run it.

*Answer: I installed Docker image on two machines (Run ansible-playbook docker-install.yml (see playbooks directory))*

```    
---
- hosts: all
  become: true

  tasks:
    - name: Install aptitude
      apt: name=aptitude state=latest update_cache=yes force_apt_get=yes

    - name: Install system packages
      apt: name={{ item }} state=latest update_cache=yes
      loop: [ 'apt-transport-https', 'ca-certificates', 'curl', 'software-properties-common', 'python3-pip', 'virtualenv', 'python3-setuptools']

    - name: Docker GPG apt Key Adding
      apt_key:
      url: https://download.docker.com/linux/ubuntu/gpg
      state: present

    - name: Adding Docker Repo
      apt_repository:
      repo: deb https://download.docker.com/linux/ubuntu bionic stable

    - name: Update apt and install docker-ce
      apt: update_cache=yes name=docker-ce state=latest

    - name: Install Docker Module for Python
      pip:
        name: docker

    - name: Pull hello world image
      docker_image:
        name: hello-world
        source: pull

    - name: Create Hello World container
      docker_container:
        name: hello-world
        image: hello-world
        state: started
        ports:
        - "80:80" 
```

![ansible](./images/3.png)

**EXTRA 1.** Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.  
**EXTRA 2.** Playbooks should not have default creds to databases and/or admin panel.  
**EXTRA 3.** For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).

**The result of this task will be ansible files in your GitHub.**
