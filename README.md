# install-portainer-in-swarm
Install portainer service in Docker Swarm
Step 0. 
Pre-installation. You need ready Docker Swarm, master and worker hosts.

Step 1. 
Create portainer volume
sudo docker volume create -d local portainer_data

Step 2. 
Create portainer volume
sudo docker volume create -d local portainer_data

Step 3. 
Create service portainer
sudo docker service create \
--name portainer --publish 8000:9000 \
--constraint 'node.role == manager' \
--mount type=volume,src=portainer_data,dst=/data \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
portainer/portainer \
-H unix:///var/run/docker.sock

Step 4. 
Go to browser and enter service address: your-public-ipaddress:8000
