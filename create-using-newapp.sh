#!/bin/bash

oc new-app https://github.com/frippe75/ssh-forward.git \
    -e SSH_USER=frta \
    -e SSH_HOST=hpe.rre.nu
