#!/bin/bash

echo Starting SSH session as ssh -l ${SSH_USER} ${SSH_HOST}
ssh -l ${SSH_USER} ${SSH_HOST}
echo SSH exited, sleeping for an hour
sleep 3600

