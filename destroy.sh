#!/bin/bash

#Delete Application
kubectl delete applications/cactustech-challenge -n argocd

#Delete ArgoCD
helm uninstall argocd -n argocd

#Delete images
cd ansible/

ansible-playbook delete-ecr-image.yml

#Delete cluster
cd ../terraform/

terraform destroy