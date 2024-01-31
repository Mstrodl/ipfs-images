#!/bin/sh

PORT=31354
jq --arg ip --arg tcpPort $PORT --arg udpPort $PORT "$(curl ipinfo.io | jq -r .ip)" '.Addresses.AppendAnnounce |= [
  "/ip4/" + $ip + "/tcp/" + $tcpPort,
  "/ip4/" + $ip + "/udp/" + $udpPort + "/quic",
  "/ip4/" + $ip + "/udp/" + $udpPort + "/quic-v1",
  "/ip4/" + $ip + "/udp/" + $udpPort + "/quic-v1/webtransport"
]' /data/ipfs/config | sponge /data/ipfs/config
