#!/bin/bash

kubectl create namespace argocd

helm dependency update

helm install argocd -n argocd ./ -f values.yaml
