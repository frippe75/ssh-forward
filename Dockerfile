FROM alpine:3.1
RUN apk update \
  && apk add \
  openssh-client \
  ca-certificates \
  bash

RUN mkdir /.ssh
# https://docs.openshift.com/container-platform/3.9/creating_images/guidelines.html
RUN chgrp -R 0 /.ssh && \
    chmod -R g=u /.ssh
RUN chmod g=u /etc/passwd
ENTRYPOINT [ "uid_entrypoint" ]
USER 1001

#RUN adduser -D sshuser
#USER sshuser
COPY config /.ssh/config

# fix perms
RUN chown -R default:default /.ssh

COPY docker-entrypoint.sh /usr/local/bin/
#RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
