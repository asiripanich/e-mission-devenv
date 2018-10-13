#
# Run mongo as mongo-1
#
# Requirements
# - docker image: mongo:latest
# - docker volume: mongo-1_data, mongo-1_config
#
docker run -d \
 -p 27018:27017 \
 --restart=always \
 --network=e-mission-server \
 --name mongo-e-mission-server \
 --mount source=mongo-e-mission-server_data,target=/data/db \
 --mount source=mongo-e-mission-server_config,target=/data/configdb \
 mongo:latest \
 --bind_ip_all
