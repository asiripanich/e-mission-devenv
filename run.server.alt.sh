docker run -d \
  -p 18080:8080 \
  --name=ems-server \
  --net="ems" \
  --mount type=bind,source="$(pwd)"/res/e-mission-server/conf/storage/db.conf,target=/usr/src/app/conf/storage/db.conf,readonly \
  --mount type=bind,source="$(pwd)"/res/e-mission-server/conf/net/api/webserver.conf,target=/usr/src/app/conf/net/api/webserver.conf,readonly \
  e-mission-server:latest
