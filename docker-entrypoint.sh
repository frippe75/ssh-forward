#!/bin/bash

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

echo Starting SSH session as ssh -l ${SSH_USER} ${SSH_HOST}
ssh -l ${SSH_USER} ${SSH_HOST}
echo SSH exited, sleeping for an hour
sleep 3600

