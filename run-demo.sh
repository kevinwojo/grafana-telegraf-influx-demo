#!/bin/bash

CWD=$(pwd)

vagrant up

echo "Installing Python on Ubuntu"
ssh vagrant@192.168.33.10 'sudo apt install -y python'
ssh vagrant@192.168.33.20 'sudo apt install -y python'

echo "Running a clean ansible playbook..."
cd  $CWD/ansible
ansible-playbook playbooks/monitoring-demo.yml

echo "Returning home"
cd $CWD

echo "Demo ready to go...."
echo "Grafana is at https://192.168.33.10:3000"
echo "Login: admin,admin"
echo "Influx is at http://localhost:8088"
