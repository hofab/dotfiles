#!/bin/bash
#
# Updates home assistant docker container
#
# e.g.
# ssh -oHostKeyALgorithms=+ssh-rsa "$USER"@"$IP" 'bash -s' < <patch/to/file>ha.sh
#

HOMEASS="homeassistant"
LOCAL_CFG_FOLDER="/home/pi/homeassistant"

docker stop $HOMEASS
docker rm $HOMEASS
docker pull homeassistant/home-assistant
docker run -d --network=host --name $HOMEASS --restart=unless-stopped --privileged -v $LOCAL_CFG_FOLDER:/config  homeassistant/home-assistant
