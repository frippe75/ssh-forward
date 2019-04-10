FROM alpine:3.1
RUN apk update \
  && apk add \
  openssh-client \
  ca-certificates \
  bash


RUN adduser -D sshuser
USER sshuser
COPY config /home/sshuser/.ssh/config
COPY key/key.pem /home/sshuser/.ssh/key.pem

COPY docker-entrypoint.sh /usr/local/bin/
#RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
