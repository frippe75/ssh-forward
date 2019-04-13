#!/bin/bash

oc new-app https://github.com/frippe75/ssh-forward.git \
    -e SSH_USER=frta \
    -e SSH_HOST=hpe.rre.nu

#https://www.jannikarndt.de/blog/2018/03/ssh_key_as_kubernetes_secret/
kubectl create secret generic my-ssh-key --from-file=id_rsa=.key/key.pem



