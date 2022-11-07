#!/bin/bash
#
# Updates home assistant docker dontainer
#

HOMEASS="homeassistant"

docker stop $HOMEASS
docker rm $HOMEASS
docker pull homeassistant/home-assistant
docker run -d --network=host --name $HOMEASS -v /path/to/local/config:/config  homeassistant/home-assistant
