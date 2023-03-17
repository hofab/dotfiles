# Update home assistant docker container

Often we have to update the home assistant docker container, as there are monthly releases.
The following sequence of commands is so far the simplest way of updating the docker container.

```
docker stop home-assistant
docker rm home-assistant
docker pull homeassistant/home-assistant
docker run -d --network=host --name home-assistant --restart=unless-stopped --privileged -v /path/to/local/config:/config  homeassistant/home-assistant
```

Add `--privileged` if you need USB ports to be forwarded.

## Remote execution script
To make it even simpler, I have a script that can be executed remotely to update the container in `../scripts/ha.sh`
