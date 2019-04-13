#!/bin/bash

name=$1

oc process -f ssh-template.yaml --param APPLICATION_NAME=$name | oc create -f -

oc set env dc/$1 SSH_USER=frta
oc set env dc/$1 SSH_HOST=frta
