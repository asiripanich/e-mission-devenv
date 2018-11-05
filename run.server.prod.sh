docker run -d \
  -p 8080:8080 \
  --name=ems-server \
  --net="ems" \
  --mount type=bind,source="$(pwd)"/res/e-mission-server/conf/storage/db.conf,target=/usr/src/app/conf/storage/db.conf,readonly \
  --mount type=bind,source="$(pwd)"/res/e-mission-server/conf/net/api/webserver.prod.conf,target=/usr/src/app/conf/net/api/webserver.conf,readonly \
  --mount type=bind,source="$(pwd)"/res/e-mission-server/confidentials/seed_model.json,target=/usr/src/app/seed_model.json,readonly \
  --mount type=bind,source="$(pwd)"/res/e-mission-server/conf/net/auth/google_auth.json,target=/usr/src/app/conf/net/auth/google_auth.json,readonly \
  e-mission-server:master
