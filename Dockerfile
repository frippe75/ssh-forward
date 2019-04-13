FROM alpine:3.1
RUN apk update \
  && apk add \
  openssh-client \
  ca-certificates \
  bash

RUN adduser -D ssh
#USER sshuser

RUN mkdir -p /home/ssh/.ssh
WORKDIR /home/ssh
# https://docs.openshift.com/container-platform/3.9/creating_images/guidelines.html
RUN chgrp -R 0 /home/ssh/.ssh && \
    chmod -R g=u /home/ssh/.ssh
RUN chmod g=u /etc/passwd

COPY config /home/ssh/.ssh/config

# fix permissons
RUN chown -R ssh /home/ssh/.ssh

COPY docker-entrypoint.sh /usr/local/bin/

USER 1001
#RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
