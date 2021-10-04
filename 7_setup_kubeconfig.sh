#!/bin/bash
. ./colors.sh

if [ -d "./OpenQ-Kubeconfig" ] 
then
    echo -e "\n/OpenQ-Kubeconfig directory found\n" 
else
    echo -e "No OpenQ-Kubeconfig directory found. Cloning OpenQ-Kubeconfig...\n"
    git clone https://github.com/OpenQDev/OpenQ-Kubeconfig.git
fi