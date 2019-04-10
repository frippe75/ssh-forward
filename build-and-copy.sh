#!/bin/bash

# build the image
sudo docker build -t synergy-ssh .

# copy image
skopeo copy --dest-tls-verify=false docker://localhost:5000/synergy-ssh docker://ip-10-0-151-171.eu-central-1.compute.internal:5000
