#!/bin/bash
#
# Updates home assistant docker container
#
# e.g.
# ssh -oHostKeyALgorithms=+ssh-rsa "$USER"@"$IP" 'bash -s' < <patch/to/file>ha.sh
#

HOMEASS="homeassistant"

docker stop $HOMEASS
docker rm $HOMEASS
docker pull homeassistant/home-assistant
docker run -d --network=host --name $HOMEASS -v /path/to/local/config:/config  homeassistant/home-assistant
