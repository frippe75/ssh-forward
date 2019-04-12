#!/bin/bash

oc create secret generic my-ssh-key --from-file=id_rsa=key/key.pem
