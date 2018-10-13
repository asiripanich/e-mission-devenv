docker stop ems
docker rm ems
docker build -t e-mission-server:latest .
docker run -d \
  -p 8080:8080 \
  --name=ems \
  --net="e-mission-server" \
  --mount type=bind,source="$(pwd)"/db.conf,target=/usr/src/app/conf/storage/db.conf,readonly \
  --mount type=bind,source="$(pwd)"/webserver.conf,target=/usr/src/app/conf/net/api/webserver.conf,readonly \
  --mount type=bind,source="$(pwd)"/google_auth.json,target=/usr/src/app/conf/net/auth/google_auth.json,readonly \
  e-mission-server:latest
