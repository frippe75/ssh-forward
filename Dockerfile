FROM alpine:3.1
RUN apk update \
  && apk add \
  openssh-client \
  ca-certificates \
  bash

# https://docs.openshift.com/container-platform/3.9/creating_images/guidelines.html
#RUN chgrp -R 0 /some/directory && \
#    chmod -R g=u /some/directory

#RUN adduser -D sshuser
#USER sshuser
COPY config /config

COPY docker-entrypoint.sh /usr/local/bin/
#RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
