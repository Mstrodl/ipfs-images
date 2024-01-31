#!/bin/sh

if [ -f /data/ipfs/config ]; then
  PORT=31354
  jq --arg ip "$(curl ipinfo.io | jq -r .ip)" --arg tcpPort $PORT --arg udpPort $PORT '.Addresses.AppendAnnounce |= [
    "/ip4/" + $ip + "/tcp/" + $tcpPort,
    "/ip4/" + $ip + "/udp/" + $udpPort + "/quic",
    "/ip4/" + $ip + "/udp/" + $udpPort + "/quic-v1",
    "/ip4/" + $ip + "/udp/" + $udpPort + "/quic-v1/webtransport"
  ]' /data/ipfs/config | sponge /data/ipfs/config
fi
