#!/bin/bash

sudo docker volume create -d local portainer_data

sudo docker service create \
--name portainer --publish 8000:9000 \
--constraint 'node.role == manager' \
--mount type=volume,src=portainer_data,dst=/data \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
portainer/portainer \
-H unix:///var/run/docker.sock

# check in browser
#curl localhost:8000
