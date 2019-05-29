#!/bin/sh

echo "Print blacklist from iptables for chain DOCKER"
iptables -L DOCKER | grep DROP | awk '{print $4}'

