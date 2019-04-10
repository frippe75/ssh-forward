#!/bin/bash

oc process -f ssh-template.yaml --param APPLICATION_NAME=myssh | oc create -f -
