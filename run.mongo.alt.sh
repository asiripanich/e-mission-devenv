#
# Run mongo as ems-mongo
#
# Requirements
# - docker image: mongo:latest
# - docker volume: ems-mongo_data
#
docker run -d \
 -p 27019:27017 \
 --restart=always \
 --network=ems \
 --name ems-mongo \
 --mount source=ems-mongo_data,target=/data/db \
 mongo:latest \
 --bind_ip_all
