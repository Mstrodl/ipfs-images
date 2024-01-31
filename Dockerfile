FROM docker.io/ipfs/kubo

RUN chmod g+rw /data /data/ipfs /ipfs /ipns

USER 6969:100


