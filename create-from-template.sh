#!/bin/bash

name=$1

oc process -f ssh-template.yaml --param APPLICATION_NAME=$name | oc create -f -
