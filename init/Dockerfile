FROM docker.io/alpine

RUN apk add --no-cache jq moreutils curl

COPY entrypoint.sh /entrypoint.sh 

USER 6969:1000

CMD /bin/sh /entrypoint.sh
