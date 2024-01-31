#!/bin/sh

jq --arg IP "$(curl ipinfo.io | jq -r .ip)" '.Addresses.AppendAnnounce |= [
  "/ip4/" + $ip + "/tcp/" + $tcpPort,
  "/ip4/" + $ip + "/udp/" + $udpPort + "/quic",
  "/ip4/" + $ip + "/udp/" + $udpPort + "/quic-v1",
  "/ip4/" + $ip + "/udp/" + $udpPort + "/quic-v1/webtransport"
]' /data/ipfs/config | sponge /data/ipfs/config
