#!/bin/bash
dnf install ansible -y
cd /tmp
git clone https://github.com/Kondarao1506/ansible3.git
cd ansible3
cd expense_project_ansible
ansible-playbook -i inventory.ini mysql.yaml
ansible-playbook -i inventory.ini backend.yaml
ansible-playbook -i inventory.ini frontend.yaml

